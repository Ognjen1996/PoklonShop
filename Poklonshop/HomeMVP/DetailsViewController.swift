//
//  DetailsViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 22.11.22..
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func presonalize() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PersonalizeViewController") as! PersonalizeViewController
//        vc.selectedCategory = category[indexPath.row]
        self.present(vc, animated: true)
    }

}
