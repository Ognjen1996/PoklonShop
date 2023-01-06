//
//  PersonalizeViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 22.11.22..
//

import UIKit
import Kingfisher
import DragDropUI


class PersonalizeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var dragableView: DDImageView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var yConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var constraint: NSLayoutConstraint!
    var product: ProductData?
    var image: String?
    var selected: String?
    
    let logos: [String] = ["dogmaLogo", "dockerLogo", "lavLogo", "jelenLogo", "hopLogo", "metroLogo", "dogmaLogo2", "samoLogo", "zbirLogo", "saltoLogo", "whiteStoneLogo", ""]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dragableView.ddDelegate = self
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
        if let selected = selected {
           guard let price = product?.prices,
                let image = image,
                let name = product?.title
            else {return}
            let priceStr = String(price[0].value)
            let userInfo = ["image" : image, "logo" : selected, "price" : priceStr, "name" : name ]
            NotificationCenter.default.post(name: Notification.Name("newItem"), object: nil, userInfo: userInfo)
            
            let alert = UIAlertController(title: "Added to cart", message: "Item added to cart", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert, animated: true,completion: nil)
        }
        else {
            guard let price = product?.prices,
                 let image = image,
                 let name = product?.title
             else {return}
             let priceStr = String(price[0].value)
             let userInfo = ["image" : image, "logo" : "", "price" : priceStr, "name" : name ]
             NotificationCenter.default.post(name: Notification.Name("newItem"), object: nil, userInfo: userInfo)
             
             let alert = UIAlertController(title: "Added to cart", message: "Item added to cart without logo", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
             self.present(alert, animated: true,completion: nil)
        }
    }
}

extension PersonalizeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedLogo = logos[indexPath.row]
        self.selected = selectedLogo
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
extension PersonalizeViewController: DDViewDelegate {
    func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
        
    }
    
    func viewWasDropped(view: UIView, droppedPoint: CGPoint) {
        
        debugPrint(droppedPoint, view.frame.minY)
        if view.frame.minY > 320.0 {

            DDImageView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: 7), animations: {
                   self.dragableView.frame.origin.y = 150
            },completion: nil)
        }
        
    }
    
    
}
