//
//  LevelDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//



import Alamofire

class LevelDataManager {
    
    static let shared = LevelDataManager()
    private init() {}
    
    // MARK: - 사용자 등급 조회
    func requestSelectLevel(parameter: SelectLevelRequest, completion: @escaping (SelectLevelResponse)->(Void)){
        
        let URL = Constant.BasicURL + "level"
        
        AF.request(URL, method: .post, parameters: parameter,encoder: JSONParameterEncoder() ).validate().responseDecodable(of:SelectLevelResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }

    
    
    
    
}




