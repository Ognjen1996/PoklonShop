//
//  CategoryViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 21.11.22..
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
extension CategoryViewController: UICollectionViewDelegate {
    
    
}
extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        return cell
    }
    
    
}
