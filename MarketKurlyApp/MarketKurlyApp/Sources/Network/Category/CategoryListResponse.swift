//
//  EventResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

struct CategoryListResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [CategoryListDocument]
}

struct CategoryListDocument: Decodable {
    let cateogryId : Int
    let cateogryName : String
    let imageULR : String
}
