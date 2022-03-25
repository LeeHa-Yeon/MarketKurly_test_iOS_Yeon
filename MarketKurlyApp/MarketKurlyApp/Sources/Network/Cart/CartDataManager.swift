//
//  CartDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/24.
//

import Alamofire

class CartDataManager {
    
    static let shared = CartDataManager()
    private init() {}
    
    // MARK: - 장바구니 생성
    func requestAddCart(userId:Int, para: AddCartRequest, completion: @escaping (AddCartResponse)->(Void)){
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
    
    // MARK: - 장바구니 조회
    func requestShowCartList(userId:Int, completion: @escaping (ShowCartListResponse)->(Void)){
        let URL = Constant.BasicURL + "users/v2/\(userId)/basket/v2"
        
        AF.request(URL, method: .get ).validate().responseDecodable(of:ShowCartListResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 2장바구니 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 장바구니 삭제
    func requestDeleteCart(basketId:Int, completion: @escaping (DeleteCartResponse)->(Void)){
        // TODO: - 서버쪽에서 수정해야될 것 같음 - 이 url만 app 부분이 빠져있음
        let URL = "http://13.124.182.10:8081/basket/kurly/\(basketId)"
        AF.request(URL, method: .delete ).validate().responseDecodable(of:DeleteCartResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 3장바구니 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
}
