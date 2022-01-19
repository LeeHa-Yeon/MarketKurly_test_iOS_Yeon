//
//  EventDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

import Alamofire

class EventDataManager {
    
    static let shared = EventDataManager()
    private init() {}
    
    // MARK: - 사용자 등급 조회
    func requestEventList(completion: @escaping (EventResponse)->(Void)){
        
        let URL = Constant.BasicURL + "event"
        
        AF.request(URL, method: .get ).validate().responseDecodable(of:EventResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
}
