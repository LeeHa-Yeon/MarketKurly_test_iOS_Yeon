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
    
    // MARK: - 주문내역 리스트
    func requestMyOrderList(userId:Int, completion: @escaping (MyOrderListResponse)->(Void)){
        let URL = Constant.BasicURL + "users/v2/\(userId)/orders"
        
        AF.request(URL, method: .get ).validate().responseDecodable(of:MyOrderListResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 2 주문 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 주문 상세 내역
    func requestMyOrderDetail(userId:Int,orderId:Int ,completion: @escaping (MyOrderDetailResponse)->(Void)){
        let URL = Constant.BasicURL + "users/v2/\(userId)/orders/\(orderId)"
        
        AF.request(URL, method: .get ).validate().responseDecodable(of:MyOrderDetailResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 3 주문 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
}
