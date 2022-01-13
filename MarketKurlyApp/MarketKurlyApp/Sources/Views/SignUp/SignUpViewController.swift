//
//  SignUpViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit
import DLRadioButton

class SignUpViewController: UIViewController {
    
    // MARK: - UIComponents
    @IBOutlet weak var idTextField: UITextField! {
        didSet{
            idTextField.delegate = self
        }
    }
    @IBOutlet weak var pwdTextField: UITextField! {
        didSet{
            pwdTextField.delegate = self
        }
    }
    @IBOutlet weak var pwdCheckTextField: UITextField! {
        didSet{
            pwdCheckTextField.delegate = self
        }
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    
    @IBOutlet weak var idExplanationView: UIView!
    @IBOutlet weak var idFirstLabel: UILabel!
    @IBOutlet weak var idSecondLabel: UILabel!
    
    @IBOutlet weak var pwdExplanationView: UIView!
    @IBOutlet weak var pwdFirstLabel: UILabel!
    @IBOutlet weak var pwdSecondLabel: UILabel!
    @IBOutlet weak var pwdLastLabel: UILabel!
    
    @IBOutlet weak var pwdCheckExplanationView: UIView!
    @IBOutlet weak var pwdcheckLabel: UILabel!
    
    @IBOutlet weak var smsExplanationView: UIView!
    
    @IBOutlet weak var idConfirmBtn: UIButton!
    @IBOutlet weak var phoneNumConfirmBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBOutlet weak var idViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pwdViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pwdCheckHeight: NSLayoutConstraint!
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
        // TODO: - 알림창 띄우기
        
        
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        dismissKeyboardWhenTappedAround()
        editTextField()
    }
    
    // MARK: - Functions
    func setUI(){
        self.title = "회원가입"
        customButton(idConfirmBtn, cornerValue: 5, btnBorderColor: UIColor.mainKurlyPurple, btnBorderWidth: 1)
        customButton(phoneNumConfirmBtn, cornerValue: 5, btnBorderColor: UIColor.lightGray, btnBorderWidth: 1)
        customView(smsExplanationView, cornerValue: 5, viewBorderColor: nil, viewBorderWidth: 1)
        SignUpBtn.layer.cornerRadius = 5
        
        hiddenView(targetHeight: idViewHeight, targetView: idExplanationView)
        hiddenView(targetHeight: pwdViewHeight, targetView: pwdExplanationView)
        hiddenView(targetHeight: pwdCheckHeight, targetView: pwdCheckExplanationView)
    }
    
    func hiddenView(targetHeight: NSLayoutConstraint, targetView: UIView){
        targetHeight.constant = 0
        targetView.isHidden = true
    }
    
    func editTextField(){
        self.idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.pwdTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.pwdCheckTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - objc Functions
    @objc func textFieldDidChange(_ textField: UITextField?) {
        if textField == idTextField {
            guard let idText = idTextField.text else { return }
            if idText.count < 6 {
                idFirstLabel.textColor = #colorLiteral(red: 0.6727915406, green: 0, blue: 0, alpha: 1)
            } else {
                idFirstLabel.textColor = #colorLiteral(red: 0, green: 0.4271177351, blue: 0, alpha: 1)
            }
        } else if textField == pwdTextField {
            // TODO: - 세번째 라벨 : '동일한 숫자 3개이상 연속 사용 불가' 임시 통과
            pwdLastLabel.textColor = #colorLiteral(red: 0, green: 0.4271177351, blue: 0, alpha: 1)
            
            guard let pwdText = pwdTextField.text else { return }
            guard let pwdCheckText = pwdCheckTextField.text else { return }
            // TODO: - 두번째 라벨 : '영문/숫자...' 임시 통과
            if pwdText.count < 10 {
                pwdFirstLabel.textColor = #colorLiteral(red: 0.6727915406, green: 0, blue: 0, alpha: 1)
                pwdSecondLabel.textColor = #colorLiteral(red: 0.6727915406, green: 0, blue: 0, alpha: 1)
            } else {
                pwdFirstLabel.textColor = #colorLiteral(red: 0, green: 0.4271177351, blue: 0, alpha: 1)
                pwdSecondLabel.textColor = #colorLiteral(red: 0, green: 0.4271177351, blue: 0, alpha: 1)
            }
            
            if pwdText != pwdCheckText || pwdText == "" || pwdCheckText == "" {
                pwdcheckLabel.textColor = #colorLiteral(red: 0.6727915406, green: 0, blue: 0, alpha: 1)
            } else {
                pwdcheckLabel.textColor = #colorLiteral(red: 0, green: 0.4271177351, blue: 0, alpha: 1)
            }
            
        } else if textField == pwdCheckTextField {
            guard let pwdText = pwdTextField.text else { return }
            guard let pwdCheckText = pwdCheckTextField.text else { return }
            if pwdText != pwdCheckText || pwdText == "" || pwdCheckText == ""  {
                pwdcheckLabel.textColor = #colorLiteral(red: 0.6727915406, green: 0, blue: 0, alpha: 1)
                
            } else {
                pwdcheckLabel.textColor = #colorLiteral(red: 0, green: 0.4271177351, blue: 0, alpha: 1)
            }
        }
    }

}


extension SignUpViewController: UITextFieldDelegate {
    
    // 키보드의 리턴키를 눌렀을 때 키보드 내려가도록
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    // 텍스트필드를 눌렀을 때 작동되는 것
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idViewHeight.constant = 40
            idExplanationView.isHidden = false
        } else if textField == pwdTextField {
            pwdViewHeight.constant = 70
            pwdExplanationView.isHidden = false
        } else if textField == pwdCheckTextField {
            pwdCheckHeight.constant = 30
            pwdCheckExplanationView.isHidden = false
        }
    }
}
