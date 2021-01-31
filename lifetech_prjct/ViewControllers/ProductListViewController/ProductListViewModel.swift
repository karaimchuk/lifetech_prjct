//
//  ProductListViewModel.swift
//  lifetech_prjct
//
//  Created by Dmitry on 31.01.21.
//

import Foundation

class ProductListViewModel {
    private var productsArray:[Product] = []
    
    func readData(complition: @escaping (String?) -> Void) {
        APIManager.shared.getProductList() { [weak self] projectsArray, error in
            guard let self = self else { return }
            if let projectsArray = projectsArray {
                self.productsArray = projectsArray
            }
            complition(error)
        }
    }
    
    func numberOfItems() -> Int {
        return self.productsArray.count
    }
    
    func getProduct(index: Int) -> Product {
        return self.productsArray[index]
    }
}
