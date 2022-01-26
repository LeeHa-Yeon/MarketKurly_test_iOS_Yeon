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
    
    // MARK: - 장바구니 생성
    func requestPoint(userId:Int, para: AddCartRequest, completion: @escaping (AddCartResponse)->(Void)){
        let URL = Constant.BasicURL + "users/v2/\(userId)/basket/v2"
        
        AF.request(URL, method: .post, parameters: para, encoder: JSONParameterEncoder() ).validate().responseDecodable(of:AddCartResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 1장바구니 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
}
