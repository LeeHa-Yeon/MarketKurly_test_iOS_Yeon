//
//  AddAddressResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/21.
//

import Foundation

struct AddAddressResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}
