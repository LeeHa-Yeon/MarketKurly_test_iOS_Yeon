//
//  PwdResultViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/14.
//

import UIKit

class PwdResultViewController: UIViewController {

    let userManager = UserDataManager.shared
    var userId: Int = 0
    
    // MARK: - UIComponents
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordCheckTextField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    @IBAction func doneBtnTapped(_ sender: Any) {
        presentAlert(title: "비밀번호 변경이 완료되었습니다.")
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        dismissKeyboardWhenTappedAround()
    }
    
    // MARK: - Functions
    func setUI(){
        doneBtn.isEnabled = false
        editTextField()
    }
    
    func editTextField(){
        self.newPasswordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.newPasswordCheckTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func confirmTextField(){
        guard let newPwdText = newPasswordTextField.text else { return }
        guard let newPwdCheckText = newPasswordCheckTextField.text else { return }
        // 다 기입했을 경우
        if newPwdText != "" && newPwdCheckText != "" && newPwdText == newPwdCheckText {
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
