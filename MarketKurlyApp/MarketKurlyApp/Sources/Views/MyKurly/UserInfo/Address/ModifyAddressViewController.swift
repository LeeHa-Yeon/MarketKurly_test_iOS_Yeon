//
//  ModifyAddressViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit

class ModifyAddressViewController: UIViewController {
    
    var addressIdx: Int?
    var selectAddressInfo: SelectAddressInfoDocument?
    var isCheck: Bool = false
    
    let addressDataManager = AddressDataManager.shared
    let userInfoManager = UserInfoManaer.shared

    // MARK: - Components
    @IBOutlet weak var basicAddressStackView: UIStackView!
    @IBOutlet weak var mainAddress: UILabel!
    @IBOutlet weak var subAddress: UITextField!
    @IBOutlet weak var receiveName: UITextField!
    @IBOutlet weak var receivePhone: UITextField!
    
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var basicStackView: UIStackView!
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    
    @IBAction func saveTapped(_ sender: Any) {
        
        guard let subAddressText = subAddress.text else {
            return
        }
        var isFirstValue = 0
        
        if isCheck {
            isFirstValue = 1
        } else {
            isFirstValue = 0
        }
        let para: ModifyAddressRequest = ModifyAddressRequest(address: nil, name: receiveName.text, phoneNumber: receivePhone.text, isSelected: nil, isFirst: isFirstValue, detailAddressInfo: nil)
        
        addressDataManager.requestModifyAddress(userId: userInfoManager.getUid(), addressIdx: addressIdx!, para: para) { response in
            if response.isSuccess {
                self.navigationController?.popViewController(animated: true)
            }
            
        }

    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: "배송지를 삭제하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.addressDataManager.requestDeleteWish(addressId: self.addressIdx!) { response in
                if response.isSuccess {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler : nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: false, completion: nil)
        
    }
    
    @IBAction func checkTapped(_ sender: Any) {
        isCheck = !isCheck
        
        if isCheck {
            let imageName = UIImage(named: "I_check")
            checkBtn.setImage(imageName, for: .normal)
        } else {
            let imageName = UIImage(named: "uncheck")
            checkBtn.setImage(imageName, for: .normal)
        }
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Functions
    func setUI(){
        dismissKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        customButton(saveBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
        customButton(deleteBtn, cornerValue: 5, btnBorderColor: UIColor.lineColor, btnBorderWidth: 1)
        
    }
    
    func loadData(){
        if selectAddressInfo != nil {
            
            // 기본 배송지 아닐때, 일때
            if selectAddressInfo?.isFirst == 0 {
                basicAddressStackView.isHidden = true
                basicStackView.isHidden = false
            } else {
                basicAddressStackView.isHidden = false
                basicStackView.isHidden = true
            }
            
            if selectAddressInfo?.address != nil {
                mainAddress.text = selectAddressInfo?.address
            }
            
            if selectAddressInfo?.detail_address != nil {
                subAddress.text = selectAddressInfo?.detail_address
            }
            
            if selectAddressInfo?.name != nil {
                receiveName.text = selectAddressInfo?.name
            }
            
            if selectAddressInfo?.phoneNumber != nil {
                receivePhone.text = selectAddressInfo?.phoneNumber
            }
            
            
            
        } else {
            print("선택한 주소에 값ㅇ ㅣ없음")
        }
    }
}
