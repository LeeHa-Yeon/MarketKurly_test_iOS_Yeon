//
//  UserDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/14.
//

import Alamofire

class UserDataManager {
    
    static let shared = UserDataManager()
    private init() {}
    
    func requestAllUser(userIdx: Int,completion: @escaping (UserResponse)->(Void)){
        
        let URL = Constant.BasicURL + "users/v2/\(userIdx)"
        AF.request(URL, method: .get).validate().responseDecodable(of:UserResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    func requestChangeUserInfo(userIdx: Int,token: String ,parameter: NewUserRequest,completion: @escaping (NewUserResponse)->(Void)){
        
        let URL = Constant.BasicURL + "users/v2/\(userIdx)"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .patch, parameters: parameter,encoder: JSONParameterEncoder(),headers: HTTP_HEADERS).validate().responseDecodable(of:NewUserResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}

