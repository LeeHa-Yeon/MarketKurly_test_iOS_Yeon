//
//  UserManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit

class UserInfoManaer {
    static let shared = UserInfoManaer()
    
    private init() {}
    
    var tokenString: String?
    
    func getToken() -> String {
        guard let userToken = self.tokenString else
        {
            print("토큰없음")
            return ""
            
        }
        return userToken
    }
    
    func setToken(_ token: String ){
        self.tokenString = token
    }
    
    // 사용자 찜 내역
    var userWishListInfo: [ShowWishListDocument]?
    
    func setUserWishListInfo(_ info: [ShowWishListDocument]) {
        self.userWishListInfo = info
    }
    
    func getUserWishListInfo() -> [ShowWishListDocument]? {
        guard let userWishListInfo = self.userWishListInfo else { return nil }
        return userWishListInfo
    }
    
    // 사용자 적립금
    var userPointListInfo: PointDocument?
    
    func setUserPointListInfo(_ info: PointDocument) {
        self.userPointListInfo = info
    }
    
    func getUserPointListInfo() -> PointDocument? {
        guard let userPointListInfo = self.userPointListInfo else { return nil }
        return userPointListInfo
    }
    
    // 사용자 쿠폰 내역
    var userCouponInfo: [UserCouponListDocument]?
    
    func setUserCouponInfo(_ info: [UserCouponListDocument]) {
        self.userCouponInfo = info
    }
    
    func getUserCouponInfo() -> [UserCouponListDocument]? {
        guard let userCouponInfo = self.userCouponInfo else { return nil }
        return userCouponInfo
    }
    
    func getCouponId(idx: Int = 0) -> Int {
        guard let couponId = self.userCouponInfo?[idx].getCouponId() else { return 0 }
        
        return couponId
    }
    
    func getCouponName(idx: Int = 0) -> String {
        guard let couponName = self.userCouponInfo?[idx].getCouponName() else { return "" }
        
        return couponName
    }
    
    func getCouponDiscount(idx: Int = 0) -> Double {
        guard let discount = self.userCouponInfo?[idx].getCouponDiscount() else { return 0 }
        
        return discount
    }
    
    func getEventId(idx: Int = 0) -> Int {
        guard let eventId = self.userCouponInfo?[idx].getEventId() else { return 0 }
        
        return eventId
    }
    
    func getCouponDescription(idx: Int = 0) -> String {
        guard let description = self.userCouponInfo?[idx].getCouponDescription() else { return "" }
        
        return description
    }
    func getCouponExpiredDate(idx: Int = 0) -> String {
        guard let expired_date = self.userCouponInfo?[idx].getCouponExpiredDate() else { return "" }
        
        return expired_date
    }
    
    
    
    // 사용자 레벨
    var userLevelInfo: SelectLevelDocument?
    
    func setUserLevelInfo(_ info: SelectLevelDocument) {
        self.userLevelInfo = info
    }
    
    func getUserLevelInfo() -> SelectLevelDocument? {
        guard let userLevelInfo = self.userLevelInfo else { return nil }
        return userLevelInfo
    }
    
    
    func getLevelId() -> Int {
        guard let levelId = self.userLevelInfo?.getLevelId() else { return 100 }
        
        return levelId
    }
    
    func getLevelName() -> String {
        guard let levelName = self.userLevelInfo?.getLevelName() else { return "" }
        
        return levelName
    }
    
    func getLevelPointsRate() -> Double {
        guard let levelPointsRate = self.userLevelInfo?.getLevelPointsRate() else { return 100 }
        
        return levelPointsRate
    }
    
    
    // UserDataManager의 UserDocument 부분
    var userInfo: UserDocument?
    
    func setUserInfo(_ info: UserDocument) {
        self.userInfo = info
    }
    
    func getUserInfo() -> UserDocument? {
        guard let userInfo = self.userInfo else { return nil }
        return userInfo
    }
    
    func getUid() -> Int {
        guard let uid = self.userInfo?.getUid() else { return 0 }
        
        return uid
    }
    
    func setUid(_ uid: Int){
        userInfo?.setUid(uid)
    }
    
    func getUserId() -> String {
        guard let id = self.userInfo?.getUserId() else { return ""
        }
        return id
    }
    
    func setUserId(_ id: String){
        userInfo?.setUserId(id)
    }
    
    func getUserName() -> String {
        guard let name = self.userInfo?.getUserName() else { return ""
        }
        return name
    }
    
    func setUserName(_ name: String){
        userInfo?.setUserName(name)
    }
    
    func getUserPwd() -> String {
        guard let pwd = self.userInfo?.getUserPwd() else { return ""
        }
        return pwd
    }
    
    func setUserPwd(_ pwd: String){
        userInfo?.setUserPwd(pwd)
    }
    
    func getUserEmail() -> String {
        guard let email = self.userInfo?.getUserEmail() else { return ""
        }
        return email
    }
    
    func setUserEmail(_ email: String){
        userInfo?.setUserEmail(email)
    }
    
    func getUserPhone() -> String {
        guard let phone = self.userInfo?.getUserPhone() else { return ""
        }
        return phone
    }
    
    func setUserPhone(_ phone: String){
        userInfo?.setUserPhone(phone)
    }
    
    func getUserBirthDay() -> String {
        guard let birthDay = self.userInfo?.getUserBirth() else { return ""
        }
        return birthDay
    }
    
    func setUserBirth(_ birthDay: String){
        userInfo?.setUserBirth(birthDay)
    }
    
   
    func getUserCreatedAt() -> String {
        guard let createdAt = self.userInfo?.getUserCreatedAt() else { return ""
        }
        return createdAt
    }
    
    func setUserCreatedAt(_ createdAt: String){
        userInfo?.setUserCreatedAt(createdAt)
    }
    
    func getUserGender() -> String {
        guard let gender = self.userInfo?.getUserGender() else { return ""
        }
        return gender
    }
    
    func setUserGender(_ gender: String){
        userInfo?.setUserGender(gender)
    }
    
    func getUserLevel() -> Int {
        guard let level = self.userInfo?.getUserLevel() else { return 0 }
        
        return level
    }
    
    func setUserLevel(_ level: Int){
        userInfo?.setUserLevel(level)
    }
    
    func getUserPoint() -> Int {
        guard let point = self.userInfo?.getUserPoint() else { return 0 }
        
        return point
    }
    
    func setUserPoint(_ point: Int){
        userInfo?.setUserPoint(point)
    }
    
    

}

// assert(false,"실패")


