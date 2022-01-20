//
//  SelectCouponInfoResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//


struct SelectCouponInfoResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SelectCouponInfoDocument
}

struct SelectCouponInfoDocument: Decodable {
    let id: Int
    let couponName : String
    let discount : Double
    let eventId : Int
    let expired_date : String
    let description : String
}
