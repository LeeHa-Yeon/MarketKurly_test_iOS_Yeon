//
//  AllSubjectResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

import Foundation


struct AllSubjectResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [AllSubjectDocument]
}

struct AllSubjectDocument: Decodable {
    let homeSubjectId : Int
    let homeSubject : String
    let vice_subject : String?
}
