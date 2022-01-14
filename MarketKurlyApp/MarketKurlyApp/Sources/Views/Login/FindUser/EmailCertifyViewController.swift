//
//  EmailCertifyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class EmailCertifyViewController: UIViewController {
    
    let allUserManager = AllUserDataManager.shared
    var isFind: Bool = false
    var findUserIdx: Int?
    
    // MARK: - UIComponents
    @IBOutlet weak var idNameLabel: UILabel!
    @IBOutlet weak var idNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBAction func doneTapped(_ sender: Any) {
        allUserManager.requestAllUser { response in
            
            for idx in 0..<response.result.count {
                guard let idNameText = self.idNameTextField.text else { return }
                guard let emailText = self.emailTextField.text else { return }
                
                if "idFindStatus" == UserDefaults.standard.string(forKey: Constant.findStatusName) {
                    // 아이디찾기 - 핸드폰
                    if idNameText == response.result[idx].name && emailText == response.result[idx].email {
                        self.isFind = true
                        self.findUserIdx = response.result[idx].userId
                    }
                } else {
                    // 비밀번호찾기 - 핸드폰
                    if idNameText == response.result[idx].username && emailText == response.result[idx].email {
                        self.isFind = true
                        self.findUserIdx = response.result[idx].userId
                    }
                }
            }
            
            if self.isFind {
                // 화면전환
                if "idFindStatus" == UserDefaults.standard.string(forKey: Constant.findStatusName) {
                    // 아이디찾기 - 핸드폰
                    let storyboard = UIStoryboard(name: "Login", bundle: nil)
                    guard let IdResultVC = storyboard.instantiateViewController(identifier: "IdResultSB") as? IdResultViewController else { return }
                    IdResultVC.userId = self.findUserIdx!
                    self.navigationController?.pushViewController(IdResultVC, animated: true)
                } else {
                    // 비밀번호찾기 - 핸드폰
                    let storyboard = UIStoryboard(name: "Login", bundle: nil)
                    guard let PwdResultVC = storyboard.instantiateViewController(identifier: "PwdResultSB") as? PwdResultViewController else { return }
                    PwdResultVC.userId = self.findUserIdx!
                    self.navigationController?.pushViewController(PwdResultVC, animated: true)
                }
                
            } else {
                self.presentAlert(title: "가입시 입력하신 회원 정보가 맞는지 다시 한번 확인해 주세요.")
            }
        }
        
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setInit()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        customButton(doneBtn, cornerValue: 5, btnBorderColor: UIColor.mainKurlyPurple, btnBorderWidth: 0)
        doneBtn.isEnabled = false
        editTextField()
    }
    
    func setInit(){
        idNameTextField.text = ""
        emailTextField.text = ""
        if "idFindStatus" == UserDefaults.standard.string(forKey: Constant.findStatusName) {
            idNameLabel.text = "이름"
            idNameTextField.placeholder = " 이름을 입력해 주세요"
        }else {
            idNameLabel.text = "아이디"
            idNameTextField.placeholder = " 아이디를 입력해 주세요"
        }
    }
    
    func editTextField(){
        self.idNameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func confirmTextField(){
        guard let idNameText = idNameTextField.text else { return }
        guard let emailText = emailTextField.text else { return }
        // 다 기입했을 경우
        if idNameText != "" && emailText != "" {
            doneBtn.isEnabled = true
            doneBtn.backgroundColor = UIColor.mainKurlyPurple
        } else {
            doneBtn.isEnabled = false
            doneBtn.backgroundColor = #colorLiteral(red: 0.8940489888, green: 0.8941563964, blue: 0.8940123916, alpha: 1)
        }
    }
    
    // MARK: - objc Functions
    @objc func textFieldDidChange(_ textField: UITextField?) {
        confirmTextField()
    }
    
}
