//
//  MyKurlyOnViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class MemberMyKurlyViewController: BaseViewController {

    let dummyData: [String] = ["적립금","쿠폰","친구초대"]
    let dummyData2: [String] = ["주문 내역","선물 내역","찜한 상품","상품 후기"]
    let dummyData3: [String] = ["배송지 관리","컬리 퍼플 박스","개인정보 수정","알림 설정"]
    let dummyData4:[String] = ["상품 문의","1:1 문의","대량주문 문의"]
    let dummyData5:[String] = ["컬리소개","컬리패스","배송 안내","공지사항","자주하는 질문","고객센터","이용안내"]
    var reserves: Int = 4168
    var coupon: Int = 0
    var heartCnt: Int = 0
    
    //MARK: - UIComponents
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    // MARK: - Function
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        
    }

}

extension MemberMyKurlyViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return 1
        case 2 :
            return dummyData.count
        case 3 :
            return dummyData2.count
        case 4 :
            return dummyData3.count
        case 5 :
            return dummyData4.count
        case 6 :
            return dummyData5.count
        case 7 :
            return 1
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyInfoCell", for: indexPath) as? MyKurlyInfoCell else {
                return UITableViewCell()
            }
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as? BannerCell else {
                return UITableViewCell()
            }
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyListPlusCell", for: indexPath) as? MyKurlyListPlusCell else {
                return UITableViewCell()
            }
            cell.listNameLable.text = dummyData[indexPath.row]
            if indexPath.row == 0 {
                cell.subStrLabel.text = "\(reserves)원"
            } else if indexPath.row == 1 {
                cell.subStrLabel.text = "\(coupon)장"
            }else {
                cell.subStrLabel.text = "지금 5000원 받기"
            }
            return cell
        case 3 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyListPlusCell", for: indexPath) as? MyKurlyListPlusCell else {
                return UITableViewCell()
            }
            cell.listNameLable.text = dummyData2[indexPath.row]
            if indexPath.row == 2 {
                cell.subStrLabel.text = "\(heartCnt)개"
            } else {
                cell.subStrLabel.text = ""
            }
            return cell
        case 4 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyOnCell", for: indexPath) as? MyKurlyOnCell else {
                return UITableViewCell()
            }
            cell.listNameLabel.text = dummyData3[indexPath.row]
            return cell
        case 5 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyOnCell", for: indexPath) as? MyKurlyOnCell else {
                return UITableViewCell()
            }
            cell.listNameLabel.text = dummyData4[indexPath.row]
            return cell
        case 6 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyOnCell", for: indexPath) as? MyKurlyOnCell else {
                return UITableViewCell()
            }
            cell.listNameLabel.text = dummyData5[indexPath.row]
            return cell
        case 7 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyOnCell", for: indexPath) as? MyKurlyOnCell else {
                return UITableViewCell()
            }
            cell.listNameLabel.text = "로그아웃"
            return cell
        default:
            return UITableViewCell()
        }
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 4 {
            if indexPath.row == 0 {
                let storyboard = UIStoryboard(name: "Address", bundle: nil)
                let AddressVC = storyboard.instantiateViewController(identifier: "AddressManagmentSB")
                AddressVC.modalPresentationStyle = .fullScreen
                self.present(AddressVC, animated: true, completion: nil)
            }
        }
        
        if indexPath.section == 7 {
            UserDefaults.standard.set("", forKey: Constant.jwtName)
            UserDefaults.standard.set(0, forKey: Constant.userIdxName)
            let storyboard = UIStoryboard(name: "MyKurly", bundle: nil)
            let TempVC = storyboard.instantiateViewController(identifier: "TempSB")
            TempVC.modalPresentationStyle = .fullScreen
            self.present(TempVC, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 170
        case 1 :
            return 70
        default :
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }

}
