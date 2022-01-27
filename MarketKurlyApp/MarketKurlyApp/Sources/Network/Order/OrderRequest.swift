//
//  OrderRequest.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/27.
//

struct OrderRequest: Encodable {
    let paymentId: Int
    let deliverAddressId: Int
    let basketIds: [Int]
    let price: Int
    let points: Int?
    let couponIdList: [Int]?
}





