//
//  ModalAddressViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/16.
//

/*
 이와 같은 경고가 뜸... 
 2022-01-16 17:59:17.233168+0900 MarketKurlyApp[13163:5352502] [Warning] Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a table view cell's content view. We're considering the collapse unintentional and using standard height instead. Cell: <MarketKurlyApp.AddNewAddressCell: 0x129d687c0; baseClass = UITableViewCell; frame = (0 316.667; 390 44); clipsToBounds = YES; autoresize = W; layer = <CALayer: 0x281473a20>>
 
 */

import UIKit

class ModalAddressViewController: UIViewController {
    
    let addressDataManager = AddressDataManager.shared
    let userInfoManager = UserInfoManaer.shared
    var myAddressList: [AllAddressListDocument] = []

    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
    
    // MARK: - Functions
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
    }
    
    /* API 통신 부분 */
    func setData(){
        addressDataManager.requestShowAddressList(userId: userInfoManager.getUid(), token: userInfoManager.getToken()) { response in
            self.myAddressList = response.result
            self.tableView.reloadData()
        }
    }
    
    func alert(){
        let alert = UIAlertController(title: "배송지 선택", message: "배송지 선택이 완료되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "확인", style: .default) { (action) in
        }
        alert.addAction(defaultAction)
        self.present(alert, animated: false, completion: nil)
    }
}

extension ModalAddressViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return myAddressList.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as? AddressCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            
            let target = myAddressList[indexPath.row]
            
            cell.mainAddressLabel.text =  target.address
            cell.subAddressLabel.text = target.detail_address
            
            if target.name != nil {
                cell.userInfoLabel.isHidden = false
                // 이름이 있다
                if target.phoneNumber != nil {
                    // 넘버가 있다.
                    cell.userInfoLabel.text =
                    " \(target.name ?? " ") \(target.phoneNumber ?? " ")"
                } else {
                    cell.userInfoLabel.text = " \(target.name ?? " ")"
                }
            }else {
                if target.phoneNumber != nil {
                    cell.userInfoLabel.isHidden = false
                    cell.userInfoLabel.text = " \(target.phoneNumber ?? " ")"
                } else {
                    cell.userInfoLabel.isHidden = true
                }
            }
            
            if target.isFirst == 1 {
                cell.basicStackView.isHidden = false
            } else {
                cell.basicStackView.isHidden = true
            }
            
            if target.isSelected == 1 {
                cell.checkImg.isHidden = false
            } else {
                cell.checkImg.isHidden = true
            }
            
            return cell
        default :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addNewAddressCell", for: indexPath) as? AddNewAddressCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let target = myAddressList[indexPath.row]
        
        let para: ModifyAddressRequest = ModifyAddressRequest(address: nil, detailAddress: nil, name: nil, phoneNumber: nil, isSelected: 1, isFirst: nil, detailAddressInfo: nil)
        
        addressDataManager.requestModifyAddress(userId: userInfoManager.getUid(), addressIdx: target.id, para: para) { response in
            if response.isSuccess {
                self.setData()
                self.alert()
            }
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

class AddressCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var basicStackView: UIStackView!
    @IBOutlet weak var mainAddressLabel: UILabel!
    @IBOutlet weak var subAddressLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var checkImg: UIImageView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func setUI(){
        
    }
    
}

class AddNewAddressCell: UITableViewCell {
    
}
