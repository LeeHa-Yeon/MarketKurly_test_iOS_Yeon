//
//  FindPwdPhoneResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//
struct FindPwdPhoneResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: FindPwdPhoneDocument
}

struct FindPwdPhoneDocument: Decodable {
    let userIdx: Int
    let jwt: String
}
