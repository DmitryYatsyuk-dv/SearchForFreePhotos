//
//  PhotoListView.swift
//  SearchForFreePhotos
//
//  Created by Lucky on 31.03.2021.
//

import UIKit

protocol PhotoListItemDelegate: class {
    func selectedPhoto(photo: Photo)
}

class PhotoListView: UIView {
    
    let CELL_ID = "cellID"
    weak var delegate: PhotoListItemDelegate?
    
    lazy var vm: PhotoListViewModel = {
        let vm = PhotoListViewModel()
        vm.delegate = self
        return vm
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(PhotoCell.self, forCellReuseIdentifier: CELL_ID)
        return tv
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    func setupView() {
        addSubview(tableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

//MARK: - PhotoListItemDelegate
extension PhotoListView: PhotoListViewModelDelegate {
    func photosLoaded() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDelegate
extension PhotoListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = vm.getPhoto(at: indexPath.row)
        delegate?.selectedPhoto(photo: photo)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == vm.count - 10 {
            vm.loadPhotos()
        }
    }
}

//MARK: - UITableViewDataSource
extension PhotoListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? PhotoCell
        let photo = vm.getPhoto(at: indexPath.row)
        cell?.photographerLabel.text = photo.photographer
        cell?.photographerTagLabel.text = photo.photographer_tag
        
        if let url = URL(string: photo.src.landscape) {
            let token = vm.loadImage(url: url) { (image) in
                DispatchQueue.main.async {
                    cell?.imageV.image = image
                }
            }
            
            cell?.onReuse = {
                if let token = token {
                    self.vm.cancel(token)
                }
            }
        }
 
        
        return cell ?? UITableViewCell()
    }
}
