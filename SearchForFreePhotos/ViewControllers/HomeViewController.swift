//
//  HomeViewController.swift
//  SearchForFreePhotos
//
//  Created by Lucky on 26.03.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    let vm = PhotoListViewModel()
    
    lazy var photoList: PhotoListView = {
        let v = PhotoListView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.delegate = self
        
        return v
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        vm.delegate = self
        setupView()
    }
    //MARK: - Helpers

    func setupView() {
        view.addSubview(photoList)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoList.topAnchor.constraint(equalTo: view.topAnchor),
            photoList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - Extensions
extension HomeViewController: PhotoListItemDelegate {
    func selectedPhoto(photo: Photo) {
        //launch detail vc here
    }
}

extension HomeViewController: PhotoListViewModelDelegate {
    func photosLoaded() {
        let p = vm.getPhoto(at: 0)
        print(p.id, p.photographer_tag, p.photographer_url)
    }

}
