//
//  LoginViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class LoginViewController: BaseViewController {
    
    // MARK: - UIComponents
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func findIdTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let FindVC = storyboard.instantiateViewController(identifier: "FindSB")
        UserDefaults.standard.set("idFindStatus", forKey: Constant.findStatusName)
        FindVC.modalPresentationStyle = .fullScreen
        self.present(FindVC, animated: true, completion: nil)
        
    }
    
    @IBAction func findPwdTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let FindVC = storyboard.instantiateViewController(identifier: "FindSB")
        UserDefaults.standard.set("pwdFindStatus", forKey: Constant.findStatusName)
        FindVC.modalPresentationStyle = .fullScreen
        self.present(FindVC, animated: true, completion: nil)
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        // TODO: - 로그인 동작 구현
        let storyboard = UIStoryboard(name: "MyKurly", bundle: nil)
        let MyKurlyOnVC = storyboard.instantiateViewController(identifier: "MyKurlyOnSB")
//        MyKurlyOnVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(MyKurlyOnVC, animated: true)
//        self.present(MyKurlyOnVC, animated: true, completion: nil)
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let SignUpVC = storyboard.instantiateViewController(identifier: "SignUpSB")
        self.navigationController?.pushViewController(SignUpVC, animated: true)
//        self.present(SignUpVC, animated: true, completion: nil)
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBarAttribute(.white, .black)
    }

    //MARK: - Functions
    func setUI(){
        LoginBtn.layer.cornerRadius = 3
        SignUpBtn.layer.cornerRadius = 3
        SignUpBtn.layer.borderWidth = 1
        SignUpBtn.layer.borderColor = UIColor.mainKurlyPurple.cgColor
        self.removeLine(self.navigationController!)
        
    }
}
