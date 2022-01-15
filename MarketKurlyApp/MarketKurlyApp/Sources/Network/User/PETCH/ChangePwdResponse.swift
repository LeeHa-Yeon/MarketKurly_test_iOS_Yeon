//
//  ChangePwdResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

struct ChangePwdResponse : Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: String
}
