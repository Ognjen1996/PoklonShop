//
//  PersonalizeViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 22.11.22..
//

import UIKit
import Kingfisher

class PersonalizeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var logoImage: UIImageView!
    
//    @IBOutlet weak var textField: UITextField!
    
    let logos: [String] = ["dogmaLogo", "dockerLogo", "hopLogo", "metroLogo", "dogmaLogo2", "samoLogo", "zbirLogo", "saltoLogo", "whiteStoneLogo"]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
}

extension PersonalizeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        logoImage.image = UIImage(named: logos[indexPath.row])
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
