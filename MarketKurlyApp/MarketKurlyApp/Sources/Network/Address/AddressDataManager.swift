//
//  WishDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/21.
//

import Alamofire

class AddressDataManager {
    
    static let shared = AddressDataManager()
    private init() {}
    
    // MARK: - 배송지 조회 13
    func requestShowAddressList(userId:Int,token:String ,completion: @escaping (AllAddressListResponse)->(Void)){
        
        let URL = Constant.BasicURL + "address/\(userId)"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .get, headers: HTTP_HEADERS ).validate().responseDecodable(of:AllAddressListResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 전체 배송지1 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 특정 배송지 조회하기 14
    func requestShowSelectAddress(userId:Int,addressIdx:Int, token:String,completion: @escaping (SelectAddressInfoResponse)->(Void)){
        
        let URL = Constant.BasicURL + "address/\(userId)?addressIdx=\(addressIdx)"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .get ,headers: HTTP_HEADERS ).validate().responseDecodable(of:SelectAddressInfoResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 특정 배송지2 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 배송지 추가하기 12
    func requestAddAddress(userId:Int ,token:String,para: AddAddressRequest ,completion: @escaping (AddAddressResponse)->(Void)){
        
        let URL = Constant.BasicURL + "address/\(userId)"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .post , parameters: para,encoder: JSONParameterEncoder(),headers: HTTP_HEADERS ).validate().responseDecodable(of:AddAddressResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 배송지3 추가  네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 배송지 수정하기 71
    func requestModifyAddress(userId:Int , addressIdx:Int, para: ModifyAddressRequest ,completion: @escaping (ModifyAddressResponse)->(Void)){
        
        let URL = Constant.BasicURL + "address/\(userId)/content/\(addressIdx)"
        
        AF.request(URL, method: .patch , parameters: para,encoder: JSONParameterEncoder() ).validate().responseDecodable(of:ModifyAddressResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 배송지 수정 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    
    // MARK: - 배송지 삭제하기 72
        func requestDeleteWish(addressId:Int ,completion: @escaping (DeleteAddressResponse)->(Void)){
    
            let URL = Constant.BasicURL + "address/kurly/\(addressId)"
//            let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
    
            AF.request(URL, method: .delete ).validate().responseDecodable(of:DeleteAddressResponse.self) { response in
                switch response.result {
                case .success(let response) :
                    completion(response)
                case .failure(let error) :
                    print(" 배송지 삭제 네ㅡ워크 실패: ",error.localizedDescription)
                }
            }
        }
}
