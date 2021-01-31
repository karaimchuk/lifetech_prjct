//
//  ProductCell.swift
//  lifetech_prjct
//
//  Created by Dmitry on 28.01.21.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
        
    func configure(product:Product) {
        let url = URL(string: product.image ?? "")
        productImage.kf.setImage(with: url)
        productNameLabel.text = product.name
        productPriceLabel.text = ("Price: \(product.price ?? 1)")
    }
}
