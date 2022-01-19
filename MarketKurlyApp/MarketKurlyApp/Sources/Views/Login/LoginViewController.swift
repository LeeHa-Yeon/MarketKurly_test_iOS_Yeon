//
//  LoginViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit
import GSMessages


class LoginViewController: BaseViewController {
    
    let loginManager = LoginDataManager.shared
    let userDataManager = UserDataManager.shared
    let userInfoManager = UserInfoManaer.shared
    
    // MARK: - UIComponents
    
    @IBOutlet weak var idTextField: UITextField! {
        didSet{
            idTextField.delegate = self
        }
    }
    @IBOutlet weak var pwdTextField: UITextField! {
        didSet {
            pwdTextField.delegate = self
        }
    }
    
    
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        guard let idContent = idTextField.text else {
            return
        }
        guard let pwdContent = pwdTextField.text else {
            return
        }
        if idContent == "" {
            alertMessage(message: "아이디를 입력해주세요.")
        } else if pwdContent == "" {
            alertMessage(message: "비밀번호를 입력해주세요.")
        } else {
            setData()
        }
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
        KeyboardDismiss()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBarAttribute(.white, .black)
        self.title = "로그인"
    }
    
    //MARK: - Functions
    func setUI(){
        LoginBtn.layer.cornerRadius = 3
        SignUpBtn.layer.cornerRadius = 3
        SignUpBtn.layer.borderWidth = 1
        SignUpBtn.layer.borderColor = UIColor.mainKurlyPurple.cgColor
        self.removeLine(self.navigationController!)
    }
    
    /* API 부분 구현 */
    func setData(){
        guard let idContent = idTextField.text else {
            return
        }
        guard let pwdContent = pwdTextField.text else {
            return
        }
        let para = LoginRequest(username:idContent, password: pwdContent)
        loginManager.requestLogin(parameter: para) { response in
            if response.isSuccess {
                // 로그인 성공시
                UserDefaults.standard.set(response.result!.userIdx, forKey: Constant.userIdxName)
                UserDefaults.standard.set(response.result!.jwt,forKey: Constant.jwtName)
                self.loadUserData(userIdx: response.result!.userIdx)
                print("\(response.result!.jwt)")
            } else {
                // 로그인 실패시
                self.alertMessage(message: "아이디, 비밀번호를 확인해주세요.")
            }
        }
    }
    
    func loadUserData(userIdx: Int){
        userDataManager.requestAllUser(userIdx: userIdx) { response in

            self.userInfoManager.setUserInfo(response.result)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    func KeyboardDismiss(){
        let tap: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        idTextField.layer.borderWidth = 0
        pwdTextField.layer.borderWidth = 0
    }
    
    func alertMessage(message: String){
        showMessage(message, type: .success, options: [
            .margin(.init(top: 10, left: 10, bottom: 0, right: 10)),
            .cornerRadius(5),
            .textAlignment(.left),
            .textColor( #colorLiteral(red: 0.6685361266, green: 0, blue: 0, alpha: 1)  )
        ])
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            if idTextField.text != "" {
                pwdTextField.becomeFirstResponder()
            }
            
        } else {
            pwdTextField.resignFirstResponder()
            idTextField.layer.borderWidth = 0
            pwdTextField.layer.borderWidth = 0
        }
        return true
    }
    
    
    // 텍스트필드를 눌렀을 때 작동되는 것
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            pwdTextField.layer.borderWidth = 0
            idTextField.layer.borderWidth = 1
            idTextField.layer.cornerRadius = 5
            idTextField.layer.borderColor = UIColor.black.cgColor
        } else {
            idTextField.layer.borderWidth = 0
            pwdTextField.layer.borderWidth = 1
            pwdTextField.layer.cornerRadius = 5
            pwdTextField.layer.borderColor = UIColor.black.cgColor
        }
    }
}
