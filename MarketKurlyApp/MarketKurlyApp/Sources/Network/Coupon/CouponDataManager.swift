//
//  LevelDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//



import Alamofire

class CouponDataManager {
    
    static let shared = CouponDataManager()
    private init() {}
    
    // MARK: - 사용자 쿠폰 조회
    func requestUserCouponList(token:String,completion: @escaping (UserCouponListResponse)->(Void)){
        
        let URL = Constant.BasicURL + "coupon/user-coupon"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .get ,headers: HTTP_HEADERS ).validate().responseDecodable(of:UserCouponListResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 네트워크 실패: ",error.localizedDescription)
            }
        }
    }
    
}
