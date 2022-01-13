//
//  EmailCertifyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class EmailCertifyViewController: UIViewController {
    
    // MARK: - UIComponents
    @IBOutlet weak var idNameLabel: UILabel!
    @IBOutlet weak var idNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
        setInit()
    }
    
    // MARK: - Functions
    func setInit(){
        doneBtn.isEnabled = false
        if "idFindStatus" == UserDefaults.standard.string(forKey: Constant.findStatusName) {
            idNameLabel.text = "이름"
            idNameTextField.placeholder = " 이름을 입력해 주세요"
        }else {
            idNameLabel.text = "아이디"
            idNameTextField.placeholder = " 아이디를 입력해 주세요"
        }
    }

}
