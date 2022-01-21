//
//  AddressManagmentViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit

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
            print("확인 ",response)
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
            cell.basicImg.isHidden = false
            cell.blankLabel.isHidden = false
        } else {
            cell.basicImg.isHidden = true
            cell.blankLabel.isHidden = true
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
    
    // MARK: - Components
    @IBOutlet weak var blankLabel: UILabel!
    @IBOutlet weak var basicImg: UIImageView!
    @IBOutlet weak var mainAddress: UILabel!
    @IBOutlet weak var subAddress: UILabel!
    @IBOutlet weak var userInfo: UILabel!
    
    
    @IBAction func checkTapped(_ sender: UIButton!) {
        sender.isSelected.toggle()
        let para: ModifyAddressRequest = ModifyAddressRequest(address: nil, name: nil, phoneNumber: nil, isSelected: 1, isFirst: 1, detailAddressInfo: nil)
        
        addDataManager.requestModifyAddress(userId: userInfoManager.getUid(), addressIdx: addressIdx, para: para) { response in
        }
        
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
