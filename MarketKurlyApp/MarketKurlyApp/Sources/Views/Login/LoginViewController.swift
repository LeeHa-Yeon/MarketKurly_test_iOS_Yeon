//
//  LoginViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class LoginViewController: BaseViewController {
    
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
            print("아이디를 입력해주세요")
        } else if pwdContent == "" {
            print("비밀번호를 입력해주세요")
        } else {
            // 로그인 성공시
            
            // 로그인 실패시 
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
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        // TODO: - 로그인 동작 구현
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(true, forKey: Constant.loginStatusName)
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
    }

    //MARK: - Functions
    func setUI(){
        LoginBtn.layer.cornerRadius = 3
        SignUpBtn.layer.cornerRadius = 3
        SignUpBtn.layer.borderWidth = 1
        SignUpBtn.layer.borderColor = UIColor.mainKurlyPurple.cgColor
        self.removeLine(self.navigationController!)
    }
    
    func KeyboardDismiss(){
        let tap: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        idTextField.layer.borderWidth = 0
        pwdTextField.layer.borderWidth = 0
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            pwdTextField.becomeFirstResponder()
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
            print("dasdf")
            pwdTextField.layer.borderWidth = 0
            idTextField.layer.borderWidth = 1
            idTextField.layer.cornerRadius = 5
            idTextField.layer.borderColor = UIColor.black.cgColor
        } else {
            print("dasdfasdf")
            idTextField.layer.borderWidth = 0
            pwdTextField.layer.borderWidth = 1
            pwdTextField.layer.cornerRadius = 5
            pwdTextField.layer.borderColor = UIColor.black.cgColor
        }
    }
}
