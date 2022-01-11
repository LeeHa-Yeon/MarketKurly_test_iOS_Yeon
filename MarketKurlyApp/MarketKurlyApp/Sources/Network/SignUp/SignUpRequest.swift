//
//  SignUpRequest.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import Foundation

struct SignUpRequest: Encodable {
    let username:  String
    let email: String
    let password: String
    let phone_number: String
    let birth: String?
    let gender: String?
}
