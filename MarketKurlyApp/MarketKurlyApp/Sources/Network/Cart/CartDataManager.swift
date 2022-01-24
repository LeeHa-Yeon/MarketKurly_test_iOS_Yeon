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
    func requestAddCart(userId:Int ,para: AddCartRequest ,completion: @escaping (AddCartResponse)->(Void)){
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
