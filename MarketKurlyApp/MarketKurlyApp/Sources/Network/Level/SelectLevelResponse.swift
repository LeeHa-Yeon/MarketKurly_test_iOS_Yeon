//
//  OneLevelResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

struct SelectLevelResponse: Decodable{
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: SelectLevelDocument
}

struct SelectLevelDocument: Decodable {
    let id : Int
    let name : String
    let pointsRate : Double
    let discountRate : Int?
    let description : String
    let nextPoints : Int
    
    
    func getLevelId() -> Int {
        return self.id
    }
    
    func getLevelName() -> String {
        return self.name
    }
    
    func getLevelPointsRate() -> Double {
        return self.pointsRate
    }

}
