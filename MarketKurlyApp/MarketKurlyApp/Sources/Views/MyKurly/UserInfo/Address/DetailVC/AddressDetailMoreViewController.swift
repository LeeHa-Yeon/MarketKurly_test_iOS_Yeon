//
//  AddressDetailMoreViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit

class AddressDetailMoreViewController: UIViewController {

    var selectAddress: CurrentSelectAddressDocument?
    let userInfoManager = UserInfoManaer.shared
    let addressDataManager = AddressDataManager.shared
    
    var receiveSapce: String = "문 앞"
    var receiveSpaceDetail: String = "" // 경비실, 택배함
    var receiveSpaceEnter: String = "" // 문앞, 택배함
    var receiveSpaceEnterDetail: String = "" // 둘다 비밀번호
    var deliverCompletedMessage: String = ""
    
    
    // MARK: - Components
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var recievePlace1Content: UIView!
    @IBOutlet weak var recievePlace2Content: UIView!
    @IBOutlet weak var recievePlace3Content: UIView!
    @IBOutlet weak var recievePlace4Content: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func recivePlace1(_ sender: Any) {
        receiveSapce = "문 앞"
        recievePlace1Content.isHidden = false
        recievePlace2Content.isHidden = true
        recievePlace3Content.isHidden = true
        recievePlace4Content.isHidden = true
    }
    @IBAction func recivePlace2(_ sender: Any) {
        receiveSapce = "경비실"
        recievePlace1Content.isHidden = true
        recievePlace2Content.isHidden = false
        recievePlace3Content.isHidden = true
        recievePlace4Content.isHidden = true
        
    }
    @IBAction func recivePlace3(_ sender: Any) {
        receiveSapce = "택배함"
        recievePlace1Content.isHidden = false
        recievePlace2Content.isHidden = true
        recievePlace3Content.isHidden = false
        recievePlace4Content.isHidden = true
    }
    @IBAction func recivePlace4(_ sender: Any) {
        receiveSapce = "기타 장소"
        recievePlace1Content.isHidden = true
        recievePlace2Content.isHidden = true
        recievePlace3Content.isHidden = true
        recievePlace4Content.isHidden = false
    }
    
    @IBAction func doneFirstBtn(_ sender: Any) {
        deliverCompletedMessage = "배송 직후"
    }
    
    @IBAction func doneSecondBtn(_ sender: Any) {
        deliverCompletedMessage = "오전 7시"
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
        guard let addressInfo = selectAddress else {
            return
        }
        
        guard let receiveName = nameTextField.text else {
            return
        }
        guard let receivePhone = phoneTextField.text else {
            return
        }
        
        let document: ModifyAddressDocumnet = ModifyAddressDocumnet(receiveSpace: receiveSapce, receiveSpaceDetail: nil, receiveSpaceEnter: nil, receiveSpaveEnterDetail: nil, deliverCompletedMessage: deliverCompletedMessage)
        let para: ModifyAddressRequest = ModifyAddressRequest(address: nil, detailAddress: nil, name: receiveName, phoneNumber: receivePhone, isSelected: nil, isFirst: nil, detailAddressInfo: document)
        
        addressDataManager.requestModifyAddress(userId: userInfoManager.getUid(), addressIdx: addressInfo.id, para: para) { response in
            if response.isSuccess {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
        
        // MARK: - LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setUI()
            setData()
        }
        
        // MARK: - Functions
        func setUI(){
            dismissKeyboardWhenTappedAround()
            naviTitleDelete(navi: self.navigationController!)
            recievePlace1Content.isHidden = false
            recievePlace2Content.isHidden = true
            recievePlace3Content.isHidden = true
            recievePlace4Content.isHidden = true
            customButton(saveBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
            self.title = "배송정보"
            customNavigationBarAttribute(.white, .black)
        }
    
    /* API 통신 부분 */
    func setData(){
        guard let addressInfo = selectAddress else {
            return
        }
        if addressInfo.name != nil || addressInfo.name != "" {
            nameTextField.text = addressInfo.name
        }
        if addressInfo.phoneNumber != nil || addressInfo.phoneNumber != "" {
            phoneTextField.text = addressInfo.phoneNumber
        }
    }

}
