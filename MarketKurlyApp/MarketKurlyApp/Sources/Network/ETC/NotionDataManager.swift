//
//  NotionDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import Foundation
import Alamofire

class NotionDataManager {
    
    static let shared = NotionDataManager()
    private init() {}
    
    func requestShowNotion(completion: @escaping (NotionResponse)->(Void)){
        
        let URL = Constant.BasicURL2 + "notice"
        AF.request(URL, method: .get).validate().responseDecodable(of:NotionResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}

