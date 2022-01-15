//
//  FindPwdResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

struct FindPwdEmailResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: FindPwdEmailDocument
}

struct FindPwdEmailDocument: Decodable {
    let userIdx: Int
    let jwt: String
}
