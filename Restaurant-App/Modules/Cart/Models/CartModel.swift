//
//  CartModel.swift
//  Restaurant-App
//
//  Created by Rajiv Shrestha on 7/25/22.
//

import Foundation

struct CartModel: Codable {
    
    var shop_id: Int?
    var shop_name: String?
    var shop_location: String?
    var currency: String?
    var no_contact_delivery: Bool?
    var total_items:Int?
    var original_total: Double?
    var basket_total: Double?
    var discount: Double?
    var sub_total: Double?
    var product_cost: Double?
    var packaging_cost: Double?
    var delivery_cost: Double?
    var voucher_code: String?
    var promo_discount: Double?
    var tip: Double?
    var saved: Double?
    var total_payment: Double?
    var data: [CartItemPairs]?
    var message: String?
    var total_cart_count: Int?
    var price_cart_count: Int?
}
