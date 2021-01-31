//
//  ChosenProduct.swift
//  lifetech_prjct
//
//  Created by Dmitry on 30.01.21.
//

import UIKit
import Kingfisher

class ChosenProductViewController: UIViewController {
    @IBOutlet weak var chosenProductImageView: UIImageView!
    @IBOutlet weak var chosenProductNameLabel: UILabel!
    @IBOutlet weak var chosenProductPriceLabel: UILabel!
    var viewModel: ChosenProductViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        chosenProductImageView.kf.setImage(with: self.viewModel?.getImageUrpl())
        chosenProductNameLabel.text = self.viewModel?.getProductName()
        chosenProductPriceLabel.text = ("Price: \(self.viewModel?.getProductPrice() ?? 0)")
    }
}
