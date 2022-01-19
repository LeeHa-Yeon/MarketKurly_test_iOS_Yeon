//
//  MyKurlyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

protocol BenefitViewControllerDelegate {
    func moveToVC()
}

extension NoMemberMyKurlyViewController: BenefitViewControllerDelegate {
    func moveToVC() {
        let storyboard = UIStoryboard(name: "ETC", bundle: nil)
        let MembershipBenefitVC = storyboard.instantiateViewController(identifier: "MembershipBenefitSB")
        self.navigationController?.pushViewController(MembershipBenefitVC, animated: true)
    }
    
    
}

class NoMemberMyKurlyViewController: BaseViewController {
    
    let dummyData: [String] = ["비회원 주문 조회","알림 설정"]
    let dummyData2:[String] = ["컬리 소개","배송 안내","공지사항","자주하는 질문","고객센터","이용안내"]
    
    //MARK: - UIComponents
    @IBOutlet weak var tableView: UITableView!
    @IBAction func LoginBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let LoginVC = storyboard.instantiateViewController(identifier: "LoginSB")
        LoginVC.modalPresentationStyle = .fullScreen
        LoginVC.modalTransitionStyle = .coverVertical
        self.present(LoginVC, animated: true, completion: nil)
    }
    
    
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
    
    func moveToVC(SBName: String, SBId: String ,VCName: String){
        let storyboard = UIStoryboard(name: SBName, bundle: nil)
        let VCName = storyboard.instantiateViewController(identifier: SBId)
        self.navigationController?.pushViewController(VCName, animated: true)
    }
    
}

extension NoMemberMyKurlyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return dummyData.count
        case 2 :
            return dummyData2.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mykurlyCell", for: indexPath) as? MyKurlyCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyListCell", for: indexPath) as? MyKurlyListCell else {
                return UITableViewCell()
            }
            cell.listNameLabel.text = dummyData[indexPath.row]
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyListCell", for: indexPath) as? MyKurlyListCell else {
                return UITableViewCell()
            }
            cell.listNameLabel.text = dummyData2[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
            // TODO: 비회원주문 조회는 아직 안함
            if indexPath.row == 0 {
                presentAlert(title: "미구현")
//                moveToVC(SBName: "ETC", SBId: "NoticeSB" ,VCName: "NoticeVC")
            }
            
            // 알림설정
            if indexPath.row == 1 {
                moveToVC(SBName: "ETC", SBId: "NoticeSB" ,VCName: "NoticeVC")
            }
        }
        
        if indexPath.section == 2 {
            // 컬리소개
           
            if indexPath.row == 0 {
                print("ㅉㅉㅉ")
                moveToVC(SBName: "ETC", SBId: "AboutKurlySB" ,VCName: "AboutKurlyVC")
                
            }
            // 배송안내
            if indexPath.row == 1 {
                moveToVC(SBName: "ETC", SBId: "DeliveryNotionSB" ,VCName: "DeliveryNotionVC")
            }
            
            // 공지사항
            if indexPath.row == 2 {
                moveToVC(SBName: "ETC", SBId: "NotionListSB" ,VCName: "NotionListVC")
            }
            
            // 자주하는 질문
            if indexPath.row == 3 {
                presentAlert(title: "미구현")
//                moveToVC(SBName: "ETC", SBId: "CustomerSCSB" ,VCName: "CustomerSCVC")
            }
            
            // 고객센터
            if indexPath.row == 4 {
                moveToVC(SBName: "ETC", SBId: "CustomerSCSB" ,VCName: "CustomerSCVC")
            }
            
            // 이용안내
            if indexPath.row == 5 {
                moveToVC(SBName: "ETC", SBId: "InformationUseSB" ,VCName: "InformationUseVC")
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 230
        default :
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 7
        if section == 0 || section == 1 {
            return cellSpacingHeight
        }
        return 0
    }
    
}
