//
//  MyOrderListResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/27.
//

struct MyOrderListResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [MyOrderListDocumnet]
}

struct MyOrderListDocumnet: Decodable {
    let orderId: Int
    let userId: Int
    let paymentId: Int
    let deliverType: Int? //
    let estimatedTime: Int? //
    let deliverAt: Int? //
    let deliverId: Int
    let createdAt: String
    let paymentType: String
    let price: Int
    let status: String
    let firstItem: String
}
