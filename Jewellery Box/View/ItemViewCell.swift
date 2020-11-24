//
//  ItemViewCell.swift
//  Jewellery Box
//
//  Created by dharmanshu on 17/11/20.
//

import UIKit

class ItemViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg : UIImageView!
    @IBOutlet weak var nameLbl : UILabel!
    
    var category: Category!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)        
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.systemYellow.cgColor
        layer.borderWidth = 1.0
    }
    
    func configureCell(category : Category){
        self.category = category
        nameLbl.text = self.category.Name
        thumbImg.image = UIImage(named: self.category.Src)

    }
}
