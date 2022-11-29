//
//  DetailsViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 22.11.22..
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var product: ProductData?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    
    func setup() {
        if let product = product {
            let url = URL(string: product.images[0])
            productImage.kf.setImage(with: url)
            if product.description == "" {
                commentLabel.text = "Nema opisa za ovaj prozvod"
            }
            else {
                commentLabel.text = product.description
            }
            titleLabel.text = product.title
            if let price = product.prices {
                priceLabel.text = String(price[0].value) + " " + price[0].currency
            }
            else {
                priceLabel.text = "Nema na stanju"
            }
            
        }

    }
    @IBAction private func presonalize() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PersonalizeViewController") as! PersonalizeViewController
        vc.product = product
        vc.image = product?.images[0]
        show(vc, sender: self)
    }

}
