//
//  AddCartRequest.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/24.
//


struct AddCartRequest: Encodable {
    let itemId: Int
    let count: Int
}
