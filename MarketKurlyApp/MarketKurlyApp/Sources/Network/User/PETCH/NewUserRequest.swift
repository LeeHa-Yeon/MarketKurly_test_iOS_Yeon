//
//  NewUserRequest.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/14.
//

struct NewUserRequest: Encodable {
    let password:  String
    let newName: String?
    let newEmail: String?
    let newPhoneNumber: String?
    let newPassword: String?
}
