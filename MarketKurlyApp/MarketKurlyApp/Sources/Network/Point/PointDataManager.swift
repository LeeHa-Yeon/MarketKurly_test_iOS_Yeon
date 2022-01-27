//
//  PointDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/25.
//

// http://3.36.52.30:8081/app/users/v2/:userId/points

import Alamofire

class PointDataManager {
    
    static let shared = PointDataManager()
    private init() {}
    
    // MARK: - 적립내역
    func requestPoint(userId:Int,completion: @escaping (PointListResponse)->(Void)){
        let URL = Constant.BasicURL + "users/v2/\(userId)/points"
        
        AF.request(URL, method: .get ).validate().responseDecodable(of:PointListResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 1 적립금 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
}
