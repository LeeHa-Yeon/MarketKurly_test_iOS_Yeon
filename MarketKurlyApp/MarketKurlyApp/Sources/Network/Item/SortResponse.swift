//
//  NewProductSortResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import Foundation


struct SortResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SortDocument]
}

struct SortDocument: Decodable {
    let itemId : Int
    let name : String
    let price : Int
    let discount_rate : String
    let member_discount_price : Int
    let created_at : String
    let items_img_url : String
    let category : String
    let sub_category : String
    let coupon : Int
    let present : Int
}
