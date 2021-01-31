//
//  ChosenProductViewModel.swift
//  lifetech_prjct
//
//  Created by Dmitry on 31.01.21.
//

import Foundation

class ChosenProductViewModel {
    
    let product:Product
    
    init(product: Product) {
        self.product = product
    }
    
    func getImageUrpl() -> URL? {
        return URL(string: self.product.image ?? "")
    }
    
    func getProductName() -> String {
        return self.product.name ?? ""
    }
    
    func getProductPrice() -> Int {
        return self.product.price ?? 0
    }
}
