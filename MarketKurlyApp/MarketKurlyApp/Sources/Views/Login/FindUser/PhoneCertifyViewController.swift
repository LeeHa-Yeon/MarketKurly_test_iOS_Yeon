//
//  PhoneCertifyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class PhoneCertifyViewController: UIViewController {
    
    let allUserManager = AllUserDataManager.shared

    // MARK: - UIComponents
    @IBOutlet weak var idNameLabel: UILabel!
    @IBOutlet weak var idNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBAction func doneBtnTapped(_ sender: Any) {

        allUserManager.requestAllUser { response in
            for idx in 0..<response.result.count {
                guard let idNameText = self.idNameTextField.text else { return }
                guard let phoneText = self.phoneTextField.text else { return }
                if idNameText == response.result[idx].name && phoneText == response.result[idx].phoneNumber {
                    print(idx)
                    print(response.result[idx])
                }
            }
        }
        
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
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
        self.phoneTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func confirmTextField(){
        guard let idNameText = idNameTextField.text else { return }
        guard let phoneText = phoneTextField.text else { return }
        // 다 기입했을 경우
        if idNameText != "" && phoneText != "" {
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
