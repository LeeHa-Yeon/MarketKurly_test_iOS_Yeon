//
//  FindResultViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/14.
//

import UIKit

class IdResultViewController: UIViewController {
    
    let userManager = UserDataManager.shared
    var userId: Int = 0

    // MARK: - UIComponents
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userRegisterDateLabel: UILabel!
    @IBOutlet weak var pwdFindBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func pwdFindTapped(_ sender: Any) {
        UserDefaults.standard.set("pwdFindStatus", forKey: Constant.findStatusName)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func loginTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        userManager.requestAllUser(userIdx: userId) { response in
            let registerDate: String = response.result.createdAt
            
            self.userIdLabel.text = response.result.name
            
            self.userRegisterDateLabel.text = "가입일 " + registerDate.prefix(10)
            
        }
    }
    
    // MARK: - Functions
    func setUI(){
        self.title = "아이디 찾기"
        customButton(pwdFindBtn, cornerValue: 5, btnBorderColor: UIColor.mainKurlyPurple, btnBorderWidth: 1)
        customButton(loginBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
    }

}
