//
//  DeleteCartResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/24.
//

struct DeleteCartResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String
}
