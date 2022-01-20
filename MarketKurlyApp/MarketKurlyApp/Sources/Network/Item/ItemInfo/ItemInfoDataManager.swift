//
//  ItemInfoDataManger.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

import Alamofire

class ItemInfoDataManager {
    
    static let shared = ItemInfoDataManager()
    private init() {}

    // MARK: - 상세아이템 조회
    func requestItemDetailInfo(itemId: Int, completion: @escaping (ItemContentResponse)->(Void)){
        let URL = Constant.BasicURL2 + "more/\(itemId)"
        AF.request(URL, method: .get ).validate().responseDecodable(of:ItemContentResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 상세아이템 네트워크 실패: ",error.localizedDescription)
            }
        }
    }
    
}
