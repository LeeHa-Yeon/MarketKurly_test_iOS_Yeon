//
//  WishDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/21.
//

import Alamofire

class WishDataManager {
    
    static let shared = WishDataManager()
    private init() {}
    
    // MARK: - 찜하기
    func requestClickWish(userId:Int ,token:String,para: WishRequest ,completion: @escaping (DoWishResponse)->(Void)){
        
        let URL = Constant.BasicURL + "wishlist/\(userId)"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .post , parameters: para,encoder: JSONParameterEncoder(),headers: HTTP_HEADERS ).validate().responseDecodable(of:DoWishResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 1찜 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 찜 내역보기
    func requestMyWishList(userId:Int ,token:String ,completion: @escaping (ShowWishListResponse)->(Void)){
        
        let URL = Constant.BasicURL + "wishlist/\(userId)"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .get ,headers: HTTP_HEADERS ).validate().responseDecodable(of:ShowWishListResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 2찜 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    // MARK: - 찜 삭제하기
    func requestDeleteWish(userId:Int ,token:String, para: WishRequest ,completion: @escaping (DeleteWishResponse)->(Void)){
        
        let URL = Constant.BasicURL + "wishlist/\(userId)"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .delete , parameters: para,encoder: JSONParameterEncoder(),headers: HTTP_HEADERS ).validate().responseDecodable(of:DeleteWishResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 3찜 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }
    
}
