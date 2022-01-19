//
//  NotionResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//


struct NotionResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [NotionDocument]
}

struct NotionDocument: Decodable {
    let title : String
    let time : String
}
