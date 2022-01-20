//
//  MyKurlyOnViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.

import UIKit

protocol LevelViewControllerDelegate {
    func moveToAllLevelVC()
    
    func moveToNextLevelVC()
}

extension MemberMyKurlyViewController: LevelViewControllerDelegate {
    
    func moveToAllLevelVC() {
        let storyboard = UIStoryboard(name: "Level", bundle: nil)
        let AllLevelVC = storyboard.instantiateViewController(identifier: "AllLevelSB")
        self.navigationController?.pushViewController(AllLevelVC, animated: true)
    }
    
    func moveToNextLevelVC() {
        let storyboard = UIStoryboard(name: "Level", bundle: nil)
        let NextLevelVC = storyboard.instantiateViewController(identifier: "NextLevelSB")
        self.navigationController?.pushViewController(NextLevelVC, animated: true)
    }
    
}


class MemberMyKurlyViewController: BaseViewController {
    
    let dummyData: [String] = ["적립금","쿠폰","친구초대"]
    let dummyData2: [String] = ["주문 내역","선물 내역","찜한 상품","상품 후기"]
    let dummyData3: [String] = ["배송지 관리","컬리 퍼플 박스","개인정보 수정","알림 설정"]
    let dummyData4:[String] = ["상품 문의","1:1 문의","대량주문 문의"]
    let dummyData5:[String] = ["컬리소개","컬리패스","배송 안내","공지사항","자주하는 질문","고객센터","이용안내"]
    var heartCnt: Int = 0
    let userInfoManager = UserInfoManaer.shared
    
    //MARK: - UIComponents
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
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
    
    
    /* API 통신 부분  */
    func loadUserData() -> UserDocument?{
        guard let userInfo = userInfoManager.getUserInfo() else {
            print("MemberMyKurlyViewController API 실패")
            return nil
        }
        return userInfo
    }
    
    func loadLevelData() -> SelectLevelDocument?{
        guard let levelInfo = userInfoManager.getUserLevelInfo() else {
            print("MemberMyKurlyViewController API 실패")
            return nil
        }
        return levelInfo
    }
    
    func loadCouponListCnt() -> Int?{
        guard let userCouponListInfo = userInfoManager.getUserCouponInfo() else {
            print("MemberMyKurlyViewController API 실패")
            return nil
        }
        return userCouponListInfo.count
    }
    
    func loadWishItemCnt() -> Int?{
        guard let userWishListInfo = userInfoManager.getUserWishListInfo() else {
            print("MemberMyKurlyViewController API 실패")
            return nil
        }
        return userWishListInfo.count
    }
    
    
    //         // 등급 -> 일반 . 적립퍼센트
    

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
            if loadUserData() != nil {
                cell.nameLabel.text = loadUserData()?.getUserName()
                cell.rankBtn.setTitle(loadLevelData()?.getLevelName(), for: .normal)
                cell.pointRate.text = "적립 \(loadLevelData()!.getLevelPointsRate())%"
            cell.delegate = self
            }
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bannerCell", for: indexPath) as? BannerCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyListPlusCell", for: indexPath) as? MyKurlyListPlusCell else {
                return UITableViewCell()
            }
            cell.listNameLable.text = dummyData[indexPath.row]
            if indexPath.row == 0 {
                if loadUserData() != nil {
                    cell.subStrLabel.text =  DecimalWon(value: loadUserData()?.getUserPoint() ?? 900)
                }
            } else if indexPath.row == 1 {
                if loadCouponListCnt() != nil {
                    cell.subStrLabel.text = "\(loadCouponListCnt() ?? 0)장"
                }
                
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
                if loadWishItemCnt() != nil {
                    cell.subStrLabel.text = "\(loadWishItemCnt() ?? 0)개"
                }
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
        // 배너
        if indexPath.section == 1 {
            moveToVC(SBName: "ETC", SBId: "FriendSB" ,VCName: "FriendVC")
        }
        
        // 적립금, 쿠폰, 친구초대
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                // 적립금
                moveToVC(SBName: "Point", SBId: "PointSB" ,VCName: "PointVC")
            }
            if indexPath.row == 1 {
                //쿠폰
                moveToVC(SBName: "Coupon", SBId: "MyCouponListSB" ,VCName: "MyCouponListVC")
            }
            if indexPath.row == 2 {
                // 친구초대
                moveToVC(SBName: "ETC", SBId: "FriendSB" ,VCName: "FriendVC")
            }
            
        }
        
        // 주문내역,선물내역,찜한상품,상품후기
        if indexPath.section == 3 {
            if indexPath.row == 0 {
                // 주문 내역
                moveToVC(SBName: "Order", SBId: "OrderHistorySB" ,VCName: "OrderHistoryVC")
            }
            
            if indexPath.row == 1 {
                // 선물 내역
                moveToVC(SBName: "ETC", SBId: "GiftBoxSB" ,VCName: "GiftBoxVC")
            }
            
            if indexPath.row == 2 {
                // 찜한 상품
                moveToVC(SBName: "Wish", SBId: "WishSB" ,VCName: "WishVC")
            }
            
            if indexPath.row == 3 {
                // 상품 후기
                moveToVC(SBName: "ETC", SBId: "RootReviewSB" ,VCName: "RootReviewVC")
            }
            
        }
        
        //배송지관리, 컬리퍼플박스, 개인정보수정, 알림설정
        if indexPath.section == 4 {
            
            if indexPath.row == 0 {
                // 배송지 관리
                moveToVC(SBName: "Address", SBId: "AddressManagmentSB" ,VCName: "AddressVC")
            }
            
            if indexPath.row == 1 {
                // 컬리 퍼플 박스
                moveToVC(SBName: "ETC", SBId: "KurlyPurpleBoxSB" ,VCName: "KurlyPurpleBoxVC")
            }
            
            if indexPath.row == 2 {
                // 개인정보 수정
                presentAlert(title: "미구현")
            }
        
            if indexPath.row == 3 {
                // 알림 설정
                moveToVC(SBName: "ETC", SBId: "NoticeSB" ,VCName: "NoticeVC")
            }
        }
        
        // 상품문의, 1:1문의, 대량주문 문의
        
        // 컬리소개 ~ 이용안내
        if indexPath.section == 6 {
            // 컬리소개
           
            if indexPath.row == 0 {
                moveToVC(SBName: "ETC", SBId: "AboutKurlySB" ,VCName: "AboutKurlyVC")
                
            }
            // 컬리패스
            if indexPath.row == 1 {
                moveToVC(SBName: "ETC", SBId: "KurlyPassSB" ,VCName: "KurlyPassVC")
                
            }
            
            
            // 배송안내
            if indexPath.row == 2 {
                moveToVC(SBName: "ETC", SBId: "DeliveryNotionSB" ,VCName: "DeliveryNotionVC")
            }
            
            // 공지사항
            if indexPath.row == 3 {
                moveToVC(SBName: "ETC", SBId: "NotionListSB" ,VCName: "NotionListVC")
            }
            
            // 자주하는 질문
            if indexPath.row == 4 {
                presentAlert(title: "미구현")
            }
            
            // 고객센터
            if indexPath.row == 5 {
                moveToVC(SBName: "ETC", SBId: "CustomerSCSB" ,VCName: "CustomerSCVC")
            }
            
            // 이용안내
            if indexPath.row == 6 {
                moveToVC(SBName: "ETC", SBId: "InformationUseSB" ,VCName: "InformationUseVC")
            }
        }
        
        
        // 로그아웃
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
