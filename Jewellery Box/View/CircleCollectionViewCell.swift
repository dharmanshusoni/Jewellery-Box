//
//  CircleCollectionViewCell.swift
//  Jewellery Box
//
//  Created by dharmanshu on 16/11/20.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CircleCollectionViewCell"
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 150.0/2.0
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.link.cgColor
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = contentView.bounds
    }
    
    public func configure(with name: String){
        myImageView.image = UIImage(named: name)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
