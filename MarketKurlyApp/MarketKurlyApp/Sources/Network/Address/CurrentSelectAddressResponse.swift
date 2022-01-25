//
//  CurrentSelectAddressResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/25.
//

struct CurrentSelectAddressResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: CurrentSelectAddressDocument
}

struct CurrentSelectAddressDocument: Decodable {
    let id : Int
    let userId : Int
    let address : String
    let detail_address : String?
    let name : String?
    let phoneNumber : String?
    let isSelected : Int
    let isFirst : Int
    let detailAddressInfo : CurrentSubAddressDocument?

}

struct CurrentSubAddressDocument: Decodable {
    let receiveSpace : String?
    let receiveSpaceDetail : String?
    let receiveSpaceEnter : String?
    let receiveSpaceEnterDetail : String?
    let deliverCompletedMessage : String?
}
