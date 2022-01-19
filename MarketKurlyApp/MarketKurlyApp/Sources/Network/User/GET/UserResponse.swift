//
//  UserResponse.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/14.
//

struct UserResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: UserDocument
}

struct UserDocument: Decodable {
    var userId: Int
    var name: String
    var username: String
    var level: Int
    var point: Int
    var email: String
    var password: String
    var phoneNumber: String
    var birthDay: String?
    var birthString: String
    var createdAt: String
    var gender: String?
    var status: String?
    
    
    func getUid() -> Int {
        return self.userId
    }
    
    mutating func setUid(_ userId: Int){
        self.userId = userId
    }
    
    func getUserId() -> String {
        return self.username
    }
    
    mutating func setUserId(_ username: String){
        self.username = username
    }
    
    func getUserName() -> String {
        return self.name
    }
    
    mutating func setUserName(_ name: String){
        self.name = name
    }
    
    func getUserPwd() -> String {
        return self.password
    }
    
    mutating func setUserPwd(_ password: String){
        self.password = password
    }
    
    
    func getUserEmail() -> String {
        return self.email
    }
    
    mutating func setUserEmail(_ email: String){
        self.email = email
    }
    
    func getUserPhone() -> String {
        return self.phoneNumber
    }
    
    mutating func setUserPhone(_ phoneNumber: String){
        self.phoneNumber = phoneNumber
    }
    
    func getUserBirth() -> String {
        guard let birthday = self.birthDay else {
            assert(false,"실패")
        }
        return birthday
    }
    
    mutating func setUserBirth(_ birthday: String){
        self.birthDay = birthday
    }
    
    func getUserCreatedAt() -> String {
        return self.createdAt
    }
    
    mutating func setUserCreatedAt(_ createdAt: String){
        self.createdAt = createdAt
    }
    
    func getUserGender() -> String {
        guard let gender = self.gender else {
            assert(false,"실패")
        }
        return gender
    }
    
    mutating func setUserGender(_ gender: String){
        self.gender = gender
    }
    
    func getUserLevel() -> Int {
        return self.level
    }
    
    mutating func setUserLevel(_ level: Int){
        self.level = level
    }
    
    func getUserPoint() -> Int {
        return self.point
    }
    mutating func setUserPoint(_ point: Int){
        self.point = point
    }
    
}
