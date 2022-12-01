//
//  ProfileCollectionViewCell.swift
//  Poklonshop
//
//  Created by Ognjen on 1.12.22..
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        label.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        label.textColor = .white
    }
    
}
