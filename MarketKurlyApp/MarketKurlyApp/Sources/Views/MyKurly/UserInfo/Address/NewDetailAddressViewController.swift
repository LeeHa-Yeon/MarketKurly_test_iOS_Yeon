//
//  NewDetailAddressViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit

class NewDetailAddressViewController: UIViewController {

    let addressDataManager = AddressDataManager.shared
    let userInfoManager = UserInfoManaer.shared
    
    var mainAddress: String = ""
    var isCheck: Bool = false
    // MARK: - Components
    
    @IBOutlet weak var mainAddressLabel: UILabel!
    @IBOutlet weak var subAddressTextField: UITextField!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBAction func checkBtnTapped(_ sender: Any) {
        isCheck = !isCheck
        if isCheck {
            let imageName = UIImage(named: "I_check")
            checkBtn.setImage(imageName, for: .normal)
        }else {
            let imageName = UIImage(named: "uncheck")
            checkBtn.setImage(imageName, for: .normal)
        }
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        if subAddressTextField.text == "" {
            alertMessage()
        }else {
            var isFirstValue = 0
            if isCheck {
                isFirstValue = 1
            }
            
            let para: AddAddressRequest = AddAddressRequest(address: mainAddress, detailAddress: subAddressTextField.text, name: nil, phoneNumber: nil, isSelected: nil, isFirst: isFirstValue)
            addressDataManager.requestAddAddress(userId: userInfoManager.getUid(), token: userInfoManager.getToken(), para: para) { response in
                if response.isSuccess {
                    print("성공")
                    UserDefaults.standard.set(true, forKey: "addressBackStatusName")
                    self.navigationController?.popViewController(animated: true)
                }else {
                    print("새 배송지 저장 실패")
                    UserDefaults.standard.set(false, forKey: "addressBackStatusName")
                }
            }
        }
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    // MARK: - Functions
    func setUI(){
        dismissKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        customButton(saveBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
        mainAddressLabel.text = mainAddress
    }
    
    func alertMessage(){
        let alert = UIAlertController(title: nil, message: "나머지 주소를 입력하지 않으셨습니다.이대로 저장하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            var isFirstValue = 0
            if self.isCheck {
                isFirstValue = 1
            }
            
            let para: AddAddressRequest = AddAddressRequest(address: self.mainAddress, detailAddress: nil, name: nil, phoneNumber: nil, isSelected: nil, isFirst: isFirstValue)
            self.addressDataManager.requestAddAddress(userId: self.userInfoManager.getUid(), token: self.userInfoManager.getToken(), para: para) { response in
                if response.isSuccess {
                    print("성공2")
                    UserDefaults.standard.set(true, forKey: "addressBackStatusName")
                    self.navigationController?.popViewController(animated: true)
                }else {
                    print("새 배송지 저장 실패2")
                    UserDefaults.standard.set(false, forKey: "addressBackStatusName")
                }
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler : nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: false, completion: nil)
    }
}
