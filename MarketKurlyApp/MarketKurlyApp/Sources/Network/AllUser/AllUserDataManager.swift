//
//  AllUserDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/13.
//

import Alamofire

class AllUserDataManager {
    
    static let shared = AllUserDataManager()
    private init() {}
    
    func requestAllUser(completion: @escaping (AllUserResponse)->(Void)){
        
        let URL = Constant.BasicURL + "users/v2/"
        AF.request(URL, method: .get).validate().responseDecodable(of:AllUserResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}
