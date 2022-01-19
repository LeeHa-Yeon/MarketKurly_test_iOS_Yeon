//
//  ItemDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import Alamofire

class ItemListDataManager {
    
    static let shared = ItemListDataManager()
    private init() {}
    
    // 신상 아이템 순으로 정렬한 목록 - 신상품순
    func requestNewItemSortList(completion: @escaping (SortResponse)->(Void)){
        let URL = Constant.BasicURL2 + "items/new"
        AF.request(URL, method: .get).validate().responseDecodable(of:SortResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    // 베스트 아이템 순으로 정렬한 목록 - 추천순,판매량순
    func requestOrderItemSortList(completion: @escaping (SortResponse)->(Void)){
        let URL = Constant.BasicURL2 + "items/popular"
        AF.request(URL, method: .get).validate().responseDecodable(of:SortResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    // 알뜰상품 아이템 순으로 정렬한 목록 - 혜택순
    func requestSaleItemSortList(completion: @escaping (SortResponse)->(Void)){
        let URL = Constant.BasicURL2 + "items/discount"
        AF.request(URL, method: .get).validate().responseDecodable(of:SortResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    // 가격 낮은 아이템 순으로 정렬한 목록 - 낮은 가격순
    func requestLowPriceItemSortList(completion: @escaping (SortResponse)->(Void)){
        let URL = Constant.BasicURL2 + "items/lowprice"
        AF.request(URL, method: .get).validate().responseDecodable(of:SortResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    // 가격 높은 아이템 순으로 정렬한 목록 - 높은 가격순
    func requestHighPriceItemSortList(completion: @escaping (SortResponse)->(Void)){
        let URL = Constant.BasicURL2 + "items/highprice"
        AF.request(URL, method: .get).validate().responseDecodable(of:SortResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
}
