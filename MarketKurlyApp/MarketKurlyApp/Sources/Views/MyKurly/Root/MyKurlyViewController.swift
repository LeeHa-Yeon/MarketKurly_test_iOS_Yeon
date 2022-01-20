//
//  MyKurlyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class MyKurlyViewController: UIViewController {
    
    var isJwt: String?
    let userInfoManager = UserInfoManaer.shared
    
    //MARK: - UIComponents
    @IBOutlet weak var noMemberView: UIView!
    @IBOutlet weak var memberView: UIView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "마이컬리"
        customNavigationBarAttribute(UIColor.mainKurlyPurple, .white)
        customNaviBarItem(btnColor: .white, naviItem: self.navigationItem)
        setUI()
        
    }
    
    //MARK: - Functions
    func setUI(){
        isJwt = UserDefaults.standard.string(forKey: Constant.jwtName)!
        if isJwt == nil || isJwt == "" {
            noMemberView.alpha = 1
            memberView.alpha = 0
        } else {
            loadUserData()
            noMemberView.alpha = 0
            memberView.alpha = 1
        }
    }
    
    /* API 통신 부분 */
    func loadUserData(){
//        print("-kl--> \(userInfoManager.getUserLevelInfo())")
        print("-kl222--> \(userInfoManager.getUserCouponInfo())")
//        print("--ll-> \(userInfoManager.getLevelId())")
    }
    
}
