//
//  CategoryDataManger.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//
import Alamofire

class CategoryDataManger {
    
    static let shared = CategoryDataManger()
    private init() {}
    
    // MARK: - 전체 카테고리 조회
    func requestCategoryList(completion: @escaping (CategoryListResponse)->(Void)){
        let URL = Constant.BasicURL2 + "category/all"
        AF.request(URL, method: .get ).validate().responseDecodable(of:CategoryListResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 카테고리 네트워크 실패: ",error.localizedDescription)
            }
        }
    }
    
    
    
}
