//
//  ItemContentResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

struct ItemContentResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ItemContentDocument
}

struct ItemContentDocument: Decodable {
    let itemId : Int
    let items_img_url : String
    let name : String
    let price : Int
    let discount_rate : String
    let member_discount_price : Int
    let coupon : Int
    let couponId : Int
    let present : Int
    let quantity : Int
    let more_informaion_url : String
    let sales_unit : String
    let weight_capacity : String
    let shipping_category : String
    let origin : String
    let packaging_type : String
    let shelf_life : String
    let notification : String
    let item_details_img_url : String
    let product_description : String
}

