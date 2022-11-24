//
//  CollectionViewCell.swift
//  Poklonshop
//
//  Created by Ognjen on 24.11.22..
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImage: UIImageView!
    
    
    func setupImage(with image: BannerData) {
        guard let url = URL(string: image.image) else {return}
        bannerImage.kf.setImage(with: url)
    }
}
