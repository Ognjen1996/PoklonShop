//
//  ProductsViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 25.11.22..
//

import UIKit
import Kingfisher

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: ProductPresenter?
    var categoryID: Int?
    var products: [ProductData]? {
        didSet {
            collectionView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        if let categoryID = categoryID {
            presenter?.fetchProducts(for: String(categoryID))
        }
    }
}

extension ProductsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        guard let products = products else {return cell}
        let product = products[indexPath.row]
        cell.label.text = product.title
        guard let url = URL(string: product.images[0]) else {return cell}
        cell.imageView.kf.setImage(with: url)
        return cell
    }
    
}
extension ProductsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        guard let products = products else { return }
        vc.product = products[indexPath.row]
        show(vc, sender: self)
    }
    
}
extension ProductsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.size.width, height: collectionViewFrame.height / 2)
        
    }
}
extension ProductsViewController: ProductPresenterDelegate {
    func productPresenter(_ presenter: ProductPresenter, with data: SubCategoryData) {
        self.products = data.products
    }
    
    
}
