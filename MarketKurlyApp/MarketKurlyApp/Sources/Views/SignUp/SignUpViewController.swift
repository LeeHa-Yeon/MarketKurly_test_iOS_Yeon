//
//  SignUpViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit
import DLRadioButton

class SignUpViewController: UIViewController {
    
    //    let backItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: .none , action: .none)
    //    backItem.action = #selector(backBtn)
    
    // MARK: - UIComponents
    @IBOutlet weak var idExplanationView: UIView!
    @IBOutlet weak var smsExplanationView: UIView!
    @IBOutlet weak var idConfirmBtn: UIButton!
    @IBOutlet weak var phoneNumConfirmBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
        // TODO: - 알림창 띄우기
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        self.title = "회원가입"
        idConfirmBtn.layer.cornerRadius = 5
        idConfirmBtn.layer.borderColor = UIColor.mainKurlyPurple.cgColor
        idConfirmBtn.layer.borderWidth = 1
        //        self.navigationItem.leftBarButtonItem?.image = UIImage(systemName: "arrow.left")
        idExplanationView.frame.size.height = 0
        phoneNumConfirmBtn.layer.cornerRadius = 5
        phoneNumConfirmBtn.layer.borderColor = UIColor.lightGray.cgColor
        phoneNumConfirmBtn.layer.borderWidth = 1
        
        smsExplanationView.layer.borderWidth = 1
        smsExplanationView.layer.cornerRadius = 5
        
        SignUpBtn.layer.cornerRadius = 5
    }
    
}

