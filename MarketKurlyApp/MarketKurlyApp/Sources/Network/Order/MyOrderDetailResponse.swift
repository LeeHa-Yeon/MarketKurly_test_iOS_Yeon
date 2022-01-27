//
//  MyOrderDetailResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/27.
//

import Foundation

struct MyOrderDetailResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: MyOrderDetailDocument
}


struct MyOrderDetailDocument: Decodable {
    let orderId: Int
    let userId: Int
    let paymentId: Int
    let deliverType: Int? //
    let estimatedTime: Int? //
    let deliverAt: Int? //
    let deliverId: Int
    let createdAt: String
    let paymentType: String? //
    let price: Int
    let status: String
    let deliverAddress: DeliverAddressDocument
    let payDetail: PayDetailDocument
    let items: [ShowCartListDocument]
}

struct DeliverAddressDocument: Decodable {
    let id: Int
    let userId: Int
    let address: String
    let detail_address: String
    let name: String
    let phoneNumber: String
    let isSelected: Int
    let isFirst: Int
    let detailAddressInfo: SubAddressDocument? //
}

struct PayDetailDocument: Decodable {
    let itemPrice: Int
    let deliverPrice: Int
    let usePoint: Int
    let payPrice: Int
    let accumulatePoint: Int
}
