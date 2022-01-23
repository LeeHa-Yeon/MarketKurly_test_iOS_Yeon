//
//  SelectAddressInfoResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/21.
//

import Foundation


struct SelectAddressInfoResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SelectAddressInfoDocument]
}

struct SelectAddressInfoDocument: Decodable {
    let id : Int
    let userId : Int
    let address : String
    let detail_address : String
    let name : String?
    let phoneNumber : String?
    let isSelected : Int
    let isFirst : Int
    let detailAddressInfo : SubAddressDocument?
}
