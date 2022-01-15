//
//  UserDataManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/14.
//

import Alamofire

class UserDataManager {
    
    static let shared = UserDataManager()
    private init() {}
    
    
    // MARK: - 특정 유저의 모든 정보 조회
    func requestAllUser(userIdx: Int,completion: @escaping (UserResponse)->(Void)){
        
        let URL = Constant.BasicURL + "users/v2/\(userIdx)"
        AF.request(URL, method: .get).validate().responseDecodable(of:UserResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - 유저정보변경 API
    func requestChangeUserInfo(userIdx: Int,token: String ,parameter: NewUserRequest,completion: @escaping (NewUserResponse)->(Void)){
        
        let URL = Constant.BasicURL + "users/v2/\(userIdx)"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .patch, parameters: parameter,encoder: JSONParameterEncoder(),headers: HTTP_HEADERS).validate().responseDecodable(of:NewUserResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - 이메일로 비밀번호 찾기
    func requestFindPwdEmail(parameter: FindPwdEmailRequest, completion: @escaping (FindPwdEmailResponse)->(Void)){
        
        let URL = Constant.BasicURL + "users/v2/password"
        
        AF.request(URL, method: .post, parameters: parameter,encoder: JSONParameterEncoder() ).validate().responseDecodable(of:FindPwdEmailResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    
    // MARK: - 전화번호로 비밀번호 찾기
    func requestFindPwdPhone(parameter: FindPwdPhoneRequest, completion: @escaping (FindPwdPhoneResponse)->(Void)){
        
        let URL = Constant.BasicURL + "users/v2/password/phone"
        
        AF.request(URL, method: .post, parameters: parameter,encoder: JSONParameterEncoder() ).validate().responseDecodable(of:FindPwdPhoneResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    // MARK: - 새 비밀번호로 변경
    func requestChangePwd(userIdx: Int ,newPwd: String,token: String ,parameter: ChangePwdRequest,completion: @escaping (ChangePwdResponse)->(Void)){
        
        let URL = Constant.BasicURL + "users/v2/\(userIdx)/new-password"
        let HTTP_HEADERS: HTTPHeaders = ["X-ACCESS-TOKEN":token]
        
        AF.request(URL, method: .patch, parameters: parameter,encoder: JSONParameterEncoder(),headers: HTTP_HEADERS).validate().responseDecodable(of:ChangePwdResponse.self) { response in
            switch response.result {
            case .success(let response) :
                completion(response)
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}

