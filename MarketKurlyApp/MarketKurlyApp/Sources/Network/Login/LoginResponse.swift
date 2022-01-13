//
//  LoginResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

struct LoginResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: LoginDocument?
}

struct LoginDocument: Decodable {
    let userIdx: Int
    let jwt: String
}
