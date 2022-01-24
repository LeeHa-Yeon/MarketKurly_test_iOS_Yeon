//
//  NewAddressViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit

class NewAddressViewController: UIViewController {
    
    // MARK: - Components
    
    @IBOutlet weak var mainAddressTextField: UITextField! {
        didSet{
            mainAddressTextField.delegate = self
        }
    }
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        if mainAddressTextField.text == "" {
        }else {
            moveToVC()
        }
        
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        editTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dissmissScreen()
        setUI()
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Functions
    func setUI(){
        dismissKeyboardWhenTappedAround()
        self.title = "주소 검색"
        customNavigationBarAttribute(.white, .black)
//        naviTitleDelete(navi: self.navigationController!)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
    }
    func dissmissScreen(){
        if UserDefaults.standard.bool(forKey: "addressBackStatusName") {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func moveToVC(){
        let storyboard = UIStoryboard(name: "Address", bundle: nil)
        guard let NewDetailAddressVC = storyboard.instantiateViewController(identifier: "NewDetailAddressSB") as? NewDetailAddressViewController else { return }
        NewDetailAddressVC.mainAddress = mainAddressTextField.text!
        self.navigationController?.pushViewController(NewDetailAddressVC, animated: true)
    }
    
    func editTextField(){
        self.mainAddressTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - objc Functions
    @objc func textFieldDidChange(_ textField: UITextField?) {
        if mainAddressTextField.text == "" {
            searchBtn.isEnabled = false
        }else {
            searchBtn.isEnabled = true
        }
        
        
    }
}

extension NewAddressViewController: UITextFieldDelegate {
    
    // 키보드의 리턴키를 눌렀을 때 키보드 내려가도록
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}
