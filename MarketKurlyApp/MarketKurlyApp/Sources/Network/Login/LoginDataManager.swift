//
//  LoginDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import Alamofire

class LoginDataManager {
    static let shared = LoginDataManager()
    private init() {}
    
    func requestLogin(parameter: LoginRequest, completion: @escaping (LoginResponse)->(Void)){
        let URL = Constant.BasicURL + "users/v2/login"
        
        AF.request(URL, method: .post, parameters: parameter,encoder: JSONParameterEncoder() ).validate().responseDecodable(of:LoginResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}
