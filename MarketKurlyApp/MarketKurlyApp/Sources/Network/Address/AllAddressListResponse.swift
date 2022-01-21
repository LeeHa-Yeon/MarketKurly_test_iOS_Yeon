//
//  AllAddressListResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/21.
//


struct AllAddressListResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [AllAddressListDocument]
}

struct AllAddressListDocument: Decodable {
    let id : Int
    let userId : Int
    let address : String
    let detail_address : String
    let name : String?
    let phoneNumber : String?
    let isSelected : Int
    let isFirst : Int
    let detailAddressInfo : SubAddressDocument?

}

struct SubAddressDocument: Decodable {
    let receiveSpace : String?
    let receiveSpaceDetail : String?
    let receiveSpaceEnter : String?
    let receiveSpaceEnterDetail : String?
    let deliverCompletedMessage : String?
}
