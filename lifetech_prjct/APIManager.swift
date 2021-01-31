//
//  APIManager.swift
//  lifetech_prjct
//
//  Created by Dmitry on 28.01.21.
//

import Foundation

class APIManager {
    private init() { }
    static let shared = APIManager()
    private let session = URLSession.shared
    
    func getProductList(_ completion: @escaping (([Product]?, String?)->Void)) {
        let path = "https://s3-eu-west-1.amazonaws.com/developer-application-test/cart/list"
        guard let url = URL(string:path) else {
            completion(nil, "Wrong URL")
            return
        }
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(nil, error.localizedDescription)
            } else {
                guard let projectsData = data else {
                    completion(nil, "Wrong DATA")
                    return
                }
                let decoder = JSONDecoder()
                let array = try? decoder.decode(ProductList.self, from: projectsData)
                completion(array?.products, nil)
            }
        }
    task.resume()
    }
}
