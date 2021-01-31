//
//  MainMenu.swift
//  lifetech_prjct
//
//  Created by Dmitry on 28.01.21.
//

import UIKit
import Kingfisher

class ProductListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = ProductListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getData()
    }
    
    private func setupCollectionView() {
        self.collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func getData () {
        self.viewModel.readData { (error) in
            if let error = error {
                DispatchQueue.main.async {
                    self.showAlert(error: error)
                }
            } else {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    private func showAlert(error: String) {
        let alertController = UIAlertController(title: error, message: nil, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}

extension ProductListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        let product = viewModel.getProduct(index: indexPath.item)
        cell.configure(product: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 24)/2, height: (UIScreen.main.bounds.width - 24)/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 8
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ChosenProduct") as!
            ChosenProductViewController
        let product = viewModel.getProduct(index: indexPath.item)
        let viewModel = ChosenProductViewModel(product: product)
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
