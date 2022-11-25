//
//  PersonalizeViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 22.11.22..
//

import UIKit
import Kingfisher

protocol PersonalizeViewControllerDelegate: AnyObject {
    func personalizeData(_ presenter: PersonalizeViewController, data: String)
}

class PersonalizeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    
    
    var product: ProductData?
    var delegate: PersonalizeViewControllerDelegate?
    
    let logos: [String] = ["dogmaLogo", "dockerLogo", "lavLogo", "jelenLogo", "hopLogo", "metroLogo", "dogmaLogo2", "samoLogo", "zbirLogo", "saltoLogo", "whiteStoneLogo"]
    var selected: String?
    var cartItems: [String]? = []
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        if let product = product{
            let url = URL(string: product.images[0])
            productImage.kf.setImage(with: url)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showCart() {
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        vc.presenter = self
        guard let selected = selected else {return}
        self.delegate?.personalizeData(self, data: selected)
        let alert = UIAlertController(title: "Added to cart", message: "Item added to cart", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        vc.cartItems?.append(selected)
//        self.present(alert, animated: true, completion: nil)
//        vc.cartItems?.append(selected ?? "")
        vc.selectedLogo = selected
//        self.present(vc, animated: true)
    }
}

extension PersonalizeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedLogo = logos[indexPath.row]
        self.selected = selectedLogo
        self.cartItems?.append(selectedLogo)
        logoImage.image = UIImage(named: selectedLogo)
    }
}
extension PersonalizeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: PersonalizeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonalizeCollectionViewCell", for: indexPath) as! PersonalizeCollectionViewCell
        cell.logoImageEdit.image = UIImage(named: logos[indexPath.row])
        return cell
    }
}
extension PersonalizeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.size.width/4, height: collectionViewFrame.height / 2)
    }
}
