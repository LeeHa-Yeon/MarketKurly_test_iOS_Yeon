



//
//  AddAddressRequest.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/21.
//

import Foundation

struct ModifyAddressRequest: Encodable {
    let address: String?
    let name: String?
    let phoneNumber: String?
    let isSelected: Int?
    let isFirst: Int?
    let detailAddressInfo: ModifyAddressDocumnet?
}

struct ModifyAddressDocumnet: Encodable {
    let receiveSpace: String?
    let receiveSpaceDetail: String?
    let receiveSpaceEnter: String?
    let receiveSpaveEnterDetail: String?
    let deliverCompletedMessage: String?
}

