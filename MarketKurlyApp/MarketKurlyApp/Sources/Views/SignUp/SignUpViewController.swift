//
//  SignUpViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit
import DLRadioButton

class SignUpViewController: UIViewController {
    
    let allUserManager = AllUserDataManager.shared
    let signUpManager = SignUpDataManager.shared
    
    // 아이디, 비밀번호, 이메일, 휴대폰, 주소
    var checkArr: [String] = ["false","false","false","false"]
    var gender: String?
    
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
    @IBOutlet weak var addressDetailTextField: UITextField!
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
    
    @IBAction func allAgreementBtn(_ sender: UIButton!) {
        sender.isSelected.toggle()
    }
    
    @IBAction func agreementBtn2(_ sender: UIButton!) {
        sender.isSelected.toggle()
    }
    @IBAction func agreementBtn3(_ sender: UIButton!) {
        sender.isSelected.toggle()
    }
    @IBAction func agreementBtn4(_ sender: UIButton!) {
        sender.isSelected.toggle()
    }
    @IBAction func agreementBtn5(_ sender: UIButton!) {
        sender.isSelected.toggle()
    }
    
    @IBAction func agreementBtn6(_ sender: UIButton!) {
        sender.isSelected.toggle()
    }
    
    
    @IBOutlet weak var idViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pwdViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pwdCheckHeight: NSLayoutConstraint!
    
    @IBAction func genderMan(_ sender: Any) {
        gender = "M"
    }
    @IBAction func generWoman(_ sender: Any) {
        gender = "F"
    }
    @IBAction func generNil(_ sender: Any) {
        gender = nil
    }
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
        setData_confirmId()
    }
    
    @IBAction func phoneConfirmBtnTapped(_ sender: Any) {
        setData_confirmPhone()
    }
    
    @IBAction func singUpBtnTapped(_ sender: Any) {
        setData_singUp()
        if !checkArr.contains("false") {
            self.dismiss(animated: true, completion: nil)
        }
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
    
    /* API 통신 부분 */
    // 아이디 인증 - 전체 조회 API
    func setData_confirmId(){
        guard let idText = idTextField.text else { return }
        if idText.count < 6 {
            presentAlert(title: "6자 이상의 영문 혹은 영문과 숫자를 조합으로 입력해 주세요")
        } else {
            allUserManager.requestAllUser { response in
                for idx in 0..<response.result.count {
                    // 중복이 되었을 때 - 실패
                    if idText == response.result[idx].username {
                        self.presentAlert(title: "동일한 아이디가 이미 등록되어 있습니다")
                        self.checkArr[0] = "false"
                        self.idSecondLabel.textColor = #colorLiteral(red: 0.6727915406, green: 0, blue: 0, alpha: 1)
                    } else {
                        self.checkArr[0] = "true"
                        self.idSecondLabel.textColor = #colorLiteral(red: 0, green: 0.4271177351, blue: 0, alpha: 1)
                    }
                }
                if self.checkArr[0] != "false" {
                    self.presentAlert(title: "사용하실 수 있는 아이디입니다!")
                }
            }
        }
    }
    
    // 휴대폰 인증번호 탭 - 전체 조회 API
    func setData_confirmPhone(){
        guard let phoneText = phoneTextField.text else { return }
        allUserManager.requestAllUser { response in
            for idx in 0..<response.result.count {
                // 중복된 번호가 있을 경우 - 실패
                if response.result[idx].phoneNumber == phoneText {
                    self.presentAlert(title: "이미 회원가입된 번호입니다. 입력한 번호를 확인해 주세요. 회원가입을 하신 적이 없다면 고객센터로 문의해 주세요. ")
                    self.checkArr[3] = "false"
                }else {
                    self.checkArr[3] = "true"
                }
            }
            if self.checkArr[3] != "false" {
                self.presentAlert(title: "인증이 완료되었습니다")
            }
        }
    }
    
    // 가입버튼 탭 - 회원가입 API
    func setData_singUp(){
        // 가입일자도 넣어야됨
        guard let inputId = idTextField.text else { presentAlert(title: "아이디을(를) 입력해 주세요"); return}
        guard let inputPwd = pwdTextField.text else { presentAlert(title: "비밀번호을(를) 입력해 주세요"); return}
        guard let inputName = nameTextField.text else { presentAlert(title: "이름을(를) 입력해 주세요"); return}
        guard let inputEmail = emailTextField.text else { presentAlert(title: "이메일 형식을 확인해 주세요"); return}
        guard let inputPhone = phoneTextField.text else { presentAlert(title: "휴대폰 인증을 완료 해 주세요"); return}
        guard let inputAddress = addressTextField.text else { presentAlert(title: "주소를 입력해 주세요"); return}
        
        // 이메일은 형식으로 확인 더 해야됨
        if isValidEmail(testStr: inputEmail) {
            self.checkArr[2] = "true"
        } else {
            presentAlert(title: "이메일 형식을 확인해 주세요")
        }
        
        print("확인->\(checkArr)")
        if checkArr.contains("false") {
            // 회원가입 실패
            presentAlert(title: "모든 정보를 제대로 기입했는지 확인해주세요.")
        } else {
            // 회원가입 성공
            let para: SignUpRequest = SignUpRequest(username: inputId, email: inputEmail, password: inputPwd, phoneNumber: inputPhone, birth: birthTextField.text, gender: gender, name: inputName, address: inputAddress, detailAddress: addressDetailTextField.text)
            signUpManager.requestSignUp(parameter: para) { response in
                self.presentAlert(title: "회원가입을 축하드립니다!\n당신의 일상에 컬리를 더해 보세요.")

            }
        }
    }
    
    /* API 통신 끝 */
    
    
    func hiddenView(targetHeight: NSLayoutConstraint, targetView: UIView){
        targetHeight.constant = 0
        targetView.isHidden = true
    }
    
    func editTextField(){
        self.idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.pwdTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.pwdCheckTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
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
                checkArr[1] = "false"
            } else {
                pwdcheckLabel.textColor = #colorLiteral(red: 0, green: 0.4271177351, blue: 0, alpha: 1)
                checkArr[1] = "true"
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
