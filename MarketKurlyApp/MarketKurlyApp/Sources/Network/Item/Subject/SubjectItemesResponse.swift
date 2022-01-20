//
//  SubjectItemesResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//


struct SubjectItemesResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SubjectItemesDocument]
}

struct SubjectItemesDocument: Decodable {
    let homeSubjectId : Int
    let itemId: Int
    let name: String
    let price: Int
    let discount_rate: String
    let member_discount_price: Int
    let created_at: String
    let items_img_url: String
    let coupon: Int
    let present: Int
    let newyear_count: String
}
