//
//  SignUpresponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//


struct SignUpResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SignUpDocument
}

struct SignUpDocument: Decodable {
    let userIdx: Int
    let jwt: String
}
