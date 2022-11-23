//
//  CategoryModel.swift
//  Poklonshop
//
//  Created by Ognjen on 21.11.22..
//

import Foundation

struct CategoryModel: Codable {
    var message: String?
    var data: [CategoryData]
}
struct CategoryData: Codable {
    var id: Int
    var parent_id: Int?
    var color: String
    var image: String?
    var icon: String?
    var sku: String?
    var position: Int
    var enable_mobile: Bool
    var enable_web: Bool
    var name: String
    var product_count: Int
    var created_at: String
    var updated_at: String
    var deleted_at: String?
    var subcategories: [CategoryData]
}
