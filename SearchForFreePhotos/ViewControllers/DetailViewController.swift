//
//  DetailViewController.swift
//  SearchForFreePhotos
//
//  Created by Lucky on 07.04.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    var photo: Photo?
    private lazy var imageV: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(imageV)
        view.addSubview(closeButton)
        viewSetup()
    }
    
    
    //MARK: - Helpers
    
    func viewSetup() {
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            
            // ImageView
            imageV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageV.topAnchor.constraint(equalTo: view.topAnchor),
            imageV.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        if let url = URL(string: photo?.src.portrait ?? "") {
            _ = ImageLoader().loadImage(url, { (result) in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        self.imageV.image = image
                    }
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
    
    @objc
    func didTapCloseButton(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
