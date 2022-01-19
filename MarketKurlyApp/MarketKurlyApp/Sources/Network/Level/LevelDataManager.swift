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
    func requestSelectLevel(levelId: Int, completion: @escaping (SelectLevelResponse)->(Void)){
        
        let URL = Constant.BasicURL + "level?levelId=\(levelId)"
        
        AF.request(URL, method: .get ).validate().responseDecodable(of:SelectLevelResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(" 네ㅡ워크 실패: ",error.localizedDescription)
            }
        }
    }

    
    
    
    
}




