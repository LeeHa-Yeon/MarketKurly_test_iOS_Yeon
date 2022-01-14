//
//  SignUpDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import Alamofire


class SignUpDataManager {
    
    static let shared = SignUpDataManager()
    private init() {}
    
    func requestSignUp(parameter: SignUpRequest, completion: @escaping (SignUpResponse)->(Void)){
        
        let URL = Constant.BasicURL + "users/v2"
        
        AF.request(URL, method: .post, parameters: parameter,encoder: JSONParameterEncoder() ).validate().responseDecodable(of:SignUpResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}
