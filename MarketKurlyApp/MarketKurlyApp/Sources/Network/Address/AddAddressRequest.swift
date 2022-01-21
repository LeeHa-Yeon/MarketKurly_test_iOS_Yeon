//
//  AddAddressRequest.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/21.
//

import Foundation

struct AddAddressRequest: Encodable {
    let address : String
    let detailAddress : String
    let name : String?
    let phoneNumber : String?
    let isSelected : String?
    let isFirst : String?
}
