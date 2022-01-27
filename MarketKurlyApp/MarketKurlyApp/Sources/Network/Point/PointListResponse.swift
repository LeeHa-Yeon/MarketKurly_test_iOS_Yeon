//
//  PointListResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/27.
//

struct PointListResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: PointDocument
}

struct PointDocument: Decodable {
    let points: Int
    let userPoint: [UserPointDocument]
}

struct UserPointDocument: Decodable {
    let id: Int
    let userId: Int
    let orderId: Int
    let usedDate: String
    let used_points: Int
    let is_used: Int
}
