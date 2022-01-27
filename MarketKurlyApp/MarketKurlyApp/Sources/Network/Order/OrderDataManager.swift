//
//  OrderDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/27.
//

import Alamofire

class OrderDataManager {
    
    static let shared = OrderDataManager()
    private init() {}
    
    // MARK: - 주문하기
    func requestOrder(userId:Int, para: OrderRequest, completion: @escaping (OrderResponse)->(Void)){
        let URL = Constant.BasicURL + "users/v2/\(userId)/order"
        
        AF.request(URL, method: .post, parameters: para, encoder: JSONParameterEncoder() ).validate().responseDecodable(of:OrderResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 1 주문 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
}
