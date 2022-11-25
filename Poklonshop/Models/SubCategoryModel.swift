
import Foundation

struct SubCategoryModel: Codable {
    var message: String?
    var data: SubCategoryData
}
struct SubCategoryData: Codable {
    var id: Int?
    var parent_id: Int?
    var color: String?
    var image: String?
    var icon: String?
    var sku: String?
    var position: Int?
    var enable_mobile: Bool?
    var enable_web: Bool?
    var name: String?
    var product_count: Int?
    var created_at: String?
    var updated_at: String?
    var deleted_at: String?
    var subcategories: [CategoryData]?
    var translations: [TranslationData]?
    var products: [ProductData]?

}
struct TranslationData: Codable {
    var language_id: Int
    var name: String
    var meta_title: String
    var meta_description: String
    var meta_keywords: String
    var meta_url: String
    var meta_image: String
    var created_at: String
    var updated_at: String
    var language_identifier: String
        
}
struct ProductData: Codable {
    var id: Int?
    var engraving_type: String
    var sku: String
    var font_ids_enabled: [Int]?
    var enable_personalization: String
    var personalization_type: [String]
    var customer_design_upload_enabled: Bool
    var images: [String]
    var spec_images: [String]
    var enabled: Bool
    var printing_image: String?
    var printing_image_height: Int
    var printing_image_width: Int
    var printing_area_width: Int
    var printing_area_height: Int
    var printing_area_left: Int
    var printing_area_top: Int
    var created_at: String
    var updated_at: String
    var deleted_at: String?
    var enable_mobile: Bool
    var enable_website: Bool
    var stock_level: Int
    var shipping_width: Int
    var shipping_height: Int
    var shipping_depth: Int
    var shipping_weight: Int
    var shipping_note: String
    var title: String
    var short_description: String
    var description: String
    var specification: String
    var price: String
    var pivot: Pivot
    var categories: [CategoryData]
    var designs: [Design]?
    var variants: [Variant]?
    var tags: [String]?
    var prices: [Prices]?
    
}
struct Prices: Codable {
    var country: String?
    var value: Int
    var currency: String
    var is_dirty: Int
    var discount: String?
    var sale_price: String?
}
struct Pivot: Codable {
    var category_id: Int?
    var product_id: Int?
}
struct Design: Codable {
    var id: Int?
    var enabled: Bool
    var title: String
    var small_icon: String
    var image: String
    var preview_image: String
    var price: Int
    var layers: [Layers]?
    var created_at: String
    var updated_at: String
    var deleted_at: String?
    var pivot: Pivot
    var prices: [Prices]?

}
struct Layers: Codable {
    var type: String
    var editable: Bool
    var url: String
    var left: String
    var top: String
    var width: String
    var height: String
    var text: String
    var text_color: String?
    var text_alignment: String?
    var font_size: String
    var font_name: String
}
struct Variant: Codable {
    var id: Int?
    var product_id: Int
    var group_name: String
    var title: String
    var image: String
    var created_at: String
    var updated_at: String
    var prices: [Prices]?
    
}
