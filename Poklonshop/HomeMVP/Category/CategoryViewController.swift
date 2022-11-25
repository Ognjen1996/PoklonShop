//
//  CategoryViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 21.11.22..
//

import UIKit
import Kingfisher

class CategoryViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var presonalizeButton: UIButton!
    var selectedCategory: CategoryData?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout

        // Do any additional setup after loading the view.
    }
    
}
extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
        vc.presenter = ProductPresenter()
        if let selectedSubCategory = selectedCategory?.subcategories[indexPath.row] {
            vc.categoryID = selectedSubCategory.id
            show(vc, sender: self)
        }
        
    }
    
}
extension CategoryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedCategory?.subcategories.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.label.text = selectedCategory?.subcategories[indexPath.row].name
        guard let url = selectedCategory?.subcategories[indexPath.row].image else {return cell}
        guard let realURL = URL(string: url) else {return cell}
        cell.imageView.kf.setImage(with: realURL)
        return cell
    }
    
    
}
extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.size.width, height: collectionViewFrame.height / 2)
        
    }
}
