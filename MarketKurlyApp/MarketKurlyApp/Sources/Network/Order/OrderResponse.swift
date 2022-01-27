//
//  OrderResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/27.
//

struct OrderResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: OrderInfo
}

struct OrderInfo: Decodable {
    let orderId: Int
    let userId: Int
    let paymentId: Int
    let deliverType: Int? //
    let estimatedTime: String? // ㅇ
    let deliverAt: String? // ㅇ
    let deliverId: Int?
    let createdAt: String?
    let paymentType: String?
    let price: Int?
    let status: String
    let firstItem: String?
}
