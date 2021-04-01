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
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var photographer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(16)
        label.textColor = .white
        return label
    }()
    
    lazy var photographerTagLabel: UILabel = {
        let tag = UILabel()
        tag.translatesAutoresizingMaskIntoConstraints = false
        tag.font = tag.font.withSize(14)
        tag.textColor = .darkGray
        return tag
    }()
    
    private lazy var BlurEffectView: UIVisualEffectView = {
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
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
         
    }
    
    
}
 
