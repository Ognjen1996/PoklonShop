//
//  BannerModel.swift
//  Poklonshop
//
//  Created by Ognjen on 24.11.22..
//

import Foundation


struct BannerModel: Codable {
    var message: String?
    var data: [BannerData]
}
struct BannerData: Codable {
    var id: Int
    var active: Bool
    var action_url: String
    var type: String
    var position: Int
    var created_at: String
    var updated_at: String
    var deleted_at: String?
    var name: String
    var image: String
}
