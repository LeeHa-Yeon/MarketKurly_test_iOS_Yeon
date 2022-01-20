//
//  DoWishResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/21.
//

struct DoWishResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}
