//
//  AddressManagmentViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit


protocol AlertSelectAddressDelegate {
    func alert()
    func moveToVC(addressIndx: Int)
    func updateData()
}

extension AddressManagmentViewController: AlertSelectAddressDelegate {
    func updateData() {
        addDataManager.requestShowAddressList(userId: userInfoManager.getUid(), token: userInfoManager.getToken()) { response in
            self.myAddressList = response.result
            self.tableView.reloadData()
        }
    }
    
    func alert(){
        let alert = UIAlertController(title: "배송지 선택", message: "배송지 선택이 완료되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "확인", style: .destructive) { (action) in
        }
        alert.addAction(defaultAction)
        self.present(alert, animated: false, completion: nil)
    }
    
    func moveToVC(addressIndx: Int) {
        let storyboard = UIStoryboard(name: "Address", bundle: nil)
        
        guard let ModifyAddressVC = storyboard.instantiateViewController(identifier: "ModifyAddressSB") as? ModifyAddressViewController else { return }
        ModifyAddressVC.addressIdx = addressIndx
        addDataManager.requestShowSelectAddress(userId: userInfoManager.getUid(), addressIdx: addressIndx, token: userInfoManager.tokenString!) { response in
            ModifyAddressVC.selectAddressInfo = response.result[0]
            self.navigationController?.pushViewController(ModifyAddressVC, animated: true)
        }
        
    }
}

class AddressManagmentViewController: UIViewController {
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    let addDataManager = AddressDataManager.shared
    let userInfoManager = UserInfoManaer.shared
    var myAddressList: [AllAddressListDocument] = []
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
        setData()
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Functions
    func setUI(){
        self.title = "배송지 관리"
        customNavigationBarAttribute(.white, .black)
        naviTitleDelete(navi: self.navigationController!)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /* API 통신 부분 */
    func setData(){
        addDataManager.requestShowAddressList(userId: userInfoManager.getUid(), token: userInfoManager.getToken()) { response in
            self.myAddressList = response.result
            self.tableView.reloadData()
        }
    }
    
}

extension AddressManagmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myAddressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "addressListCell", for: indexPath) as? AddressListCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        
        let target = myAddressList[indexPath.row]
        
        cell.mainAddress.text =  target.address
        cell.subAddress.text = target.detail_address
        cell.addressIdx = target.id
        
        if target.name != nil {
            // 이름이 있다
            if target.phoneNumber != nil {
                // 넘버가 있다.
                cell.userInfo.text =
                " \(target.name ?? " ") \(target.phoneNumber ?? " ")"
            } else {
                cell.userInfo.text = " \(target.name ?? " ")"
            }
        }else {
            if target.phoneNumber != nil {
                cell.userInfo.text = " \(target.phoneNumber ?? " ")"
            } else {
                cell.userInfo.isHidden = true
            }
        }
        
        if target.isFirst == 1 {
            cell.basicStackView.isHidden = false
        } else {
            cell.basicStackView.isHidden = true
        }
        
        if target.isSelected == 1 {
            let imageName = UIImage(named: "I_check")
            cell.selectBtn.setImage(imageName, for: .normal)
        } else {
            let imageName = UIImage(named: "uncheck")
            cell.selectBtn.setImage(imageName, for: .normal)
        }
        
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}



class AddressListCell: UITableViewCell {
    
    var addressIdx: Int = 0
    let addDataManager = AddressDataManager.shared
    let userInfoManager = UserInfoManaer.shared
    
    var delegate: AlertSelectAddressDelegate?
    
    // MARK: - Components
    
    
    @IBOutlet weak var basicStackView: UIStackView!
    @IBOutlet weak var basicImg: UIImageView!
    @IBOutlet weak var mainAddress: UILabel!
    @IBOutlet weak var subAddress: UILabel!
    @IBOutlet weak var userInfo: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    
    
    
    @IBAction func checkTapped(_ sender: UIButton!) {
        let para: ModifyAddressRequest = ModifyAddressRequest(address: nil, detailAddress: nil, name: nil, phoneNumber: nil, isSelected: 1, isFirst: nil, detailAddressInfo: nil)
        
        addDataManager.requestModifyAddress(userId: userInfoManager.getUid(), addressIdx: addressIdx, para: para) { response in
            if response.isSuccess {
                self.delegate?.updateData()
                self.delegate?.alert()
            }
            
        }
        
    }
    
    @IBAction func modifyBtnTapped(_ sender: Any) {
        self.delegate?.moveToVC(addressIndx: addressIdx)
    }
    
    
    
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
