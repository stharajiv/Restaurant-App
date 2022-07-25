//
//  CartItemPairs.swift
//  Restaurant-App
//
//  Created by Rajiv Shrestha on 7/25/22.
//

import Foundation

struct CartItemPairs: Codable {
    var id, quantity, price_id: Int?
    var image, product_name, product_extras, special_instruction: String?
    var price: Double?
    var original_price: Double?
    var has_extra: Bool?
    var in_stock: Bool?
}
