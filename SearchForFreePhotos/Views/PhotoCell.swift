//
//  PhotoCell.swift
//  SearchForFreePhotos
//
//  Created by Lucky on 01.04.2021.
//

import UIKit

class PhotoCell: UITableViewCell {
    var onReuse: () -> Void = {}
    
    lazy var imageV: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var photographerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(21)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var photographerTagLabel: UILabel = {
        let tag = UILabel()
        tag.translatesAutoresizingMaskIntoConstraints = false
        tag.font = tag.font.withSize(14)
        tag.textColor = .lightGray
        tag.textAlignment = .right
        return tag
    }()
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    func setupView() {
        [imageV, blurEffectView].forEach { v in
            contentView.addSubview(v)
        }
        [photographerLabel, photographerTagLabel].forEach { v in
            blurEffectView.contentView.addSubview(v)
            
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        //image constraints
        NSLayoutConstraint.activate([
            imageV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageV.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // blur view effect
        NSLayoutConstraint.activate([
            blurEffectView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            blurEffectView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // photographer label and tag
        NSLayoutConstraint.activate([
            photographerLabel.leadingAnchor.constraint(equalTo: blurEffectView.leadingAnchor,constant: 2),
            photographerLabel.trailingAnchor.constraint(equalTo: blurEffectView.trailingAnchor,constant: -2),
            photographerLabel.topAnchor.constraint(equalTo: blurEffectView.topAnchor,constant: 2),
            photographerTagLabel.leadingAnchor.constraint(equalTo: blurEffectView.leadingAnchor,constant: 2),
            photographerTagLabel.trailingAnchor.constraint(equalTo: blurEffectView.trailingAnchor,constant: -2),
            photographerTagLabel.topAnchor.constraint(equalTo: photographerLabel.bottomAnchor,constant: 2),
            photographerTagLabel.bottomAnchor.constraint(equalTo: blurEffectView.bottomAnchor,constant: -2),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        onReuse()
        imageV.image = nil
    }
}
 
