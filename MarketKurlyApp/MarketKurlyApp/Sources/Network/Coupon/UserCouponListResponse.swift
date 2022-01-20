//
//  OneLevelResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

import Foundation

struct UserCouponListResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [UserCouponListDocument]?
}

struct UserCouponListDocument: Decodable {
    let id: Int
    let couponName : String
    let discount : Double
    let eventId : Int
    let expired_date : String
    let description : String
    
    func getCouponId() -> Int {
        return self.id
    }
    func getCouponName() -> String {
        return self.couponName
    }
    func getCouponDiscount() -> Double {
        return self.discount
    }
    func getEventId() -> Int {
        return self.eventId
    }
    func getCouponExpiredDate() -> String {
        return self.expired_date
    }
    func getCouponDescription() -> String {
        return self.description
    }
    
    
}
