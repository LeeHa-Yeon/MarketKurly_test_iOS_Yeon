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
}

