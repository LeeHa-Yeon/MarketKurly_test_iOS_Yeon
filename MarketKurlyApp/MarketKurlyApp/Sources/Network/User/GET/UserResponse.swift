//
//  UserResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/14.
//

struct UserResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: UserDocument
}

struct UserDocument: Decodable {
    let userId: Int
    let name: String
    let level: Int
    let point: Int
    let email: String
    let password: String
    let phoneNumber: String
    let birthDay: String?
    let birthString: String
    let gender: String?
    let status: String?
}
