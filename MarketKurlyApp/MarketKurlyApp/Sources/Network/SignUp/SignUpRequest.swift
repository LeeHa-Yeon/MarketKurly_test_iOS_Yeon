//
//  SignUpRequest.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//


struct SignUpRequest: Encodable {
    let username:  String
    let email: String
    let password: String
    let phoneNumber: String
    let birth: String?
    let gender: String?
    let name: String
    let address: String
    let detailAddress: String?
}
