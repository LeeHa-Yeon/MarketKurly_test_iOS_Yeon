//
//  AllUserResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/13.
//

struct AllUserResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [AllUserDocument]
}

struct AllUserDocument: Decodable {
    let userId: Int
    let name: String  // 이름
    let username: String  // 아이디
    let level: Int?
    let point: Int?
    let email: String
    let password: String
    let phoneNumber: String
    let birthString: String?
    let birthDay: String?
    let createdAt: String
    let gender: String?
    let status: String?
}
