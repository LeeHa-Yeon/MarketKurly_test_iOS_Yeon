//
//  LoginViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - UIComponents
    
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var SignUpBtn: UIButton!
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    //MARK: - Functions
    func setUI(){
        LoginBtn.layer.cornerRadius = 3
        SignUpBtn.layer.cornerRadius = 3
        SignUpBtn.layer.borderWidth = 1
        SignUpBtn.layer.borderColor = UIColor.mainKurlyPurple.cgColor
    }
}
