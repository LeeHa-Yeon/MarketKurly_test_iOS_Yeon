//
//  EventResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

struct EventResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [EventDocument]
}

struct EventDocument: Decodable {
    let id : Int
    let description : String
}
