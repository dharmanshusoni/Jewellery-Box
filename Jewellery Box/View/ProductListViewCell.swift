//
//  ProductListViewCell.swift
//  Jewellery Box
//
//  Created by dharmanshu on 19/11/20.
//

import UIKit

class ProductListViewCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg : UIImageView!
    @IBOutlet weak var ProductNameLbl : UILabel!
    @IBOutlet weak var WeightNameLbl : UILabel!
    @IBOutlet weak var KaratNameLbl : UILabel!
    
    var product: Product!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.systemYellow.cgColor
        layer.borderWidth = 1.0
    }
    
    func configureCell(product : Product){
        self.product = product
        ProductNameLbl.text = self.product.ProName
        WeightNameLbl.text = self.product.Weight
        KaratNameLbl.text = self.product.Karat
        thumbImg.image = UIImage(named: "default")
    }
}
