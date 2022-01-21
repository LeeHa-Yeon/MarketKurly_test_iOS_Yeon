//
//  ItemDetailViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/14.
//

import UIKit
import XLPagerTabStrip

class ItemDetailViewController: ButtonBarPagerTabStripViewController {
    
    let wishDataManager = WishDataManager.shared
    let userInfoManager = UserInfoManaer.shared
    
    let purpleInspireColor = UIColor.mainKurlyPurple
    let reviewCnt: Int? = nil
    var itemDocument: ItemContentDocument?
    
    // MARK: - Components
    @IBOutlet weak var fixView: UIView!
    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var presentBtn: UIButton!
    @IBOutlet weak var buyBtn: UIButton!
    
    @IBAction func heartBtnTapped(_ sender: UIButton!) {
        sender.isSelected.toggle()
        let request: WishRequest = WishRequest(itemId: itemDocument!.itemId)
        print(itemDocument!.itemId)
        print(userInfoManager.getUserInfo()!.userId)
        wishDataManager.requestClickWish(userId: userInfoManager.getUserInfo()!.userId, token: userInfoManager.getToken(), para: request) { response in
            self.wishDataManager.requestMyWishList(userId: self.userInfoManager.getUid(), token: self.userInfoManager.getToken()) { response in
                self.userInfoManager.setUserWishListInfo(response.result)

            }
        }
        
    }
    @IBAction func buyBtnTapped(_ sender: Any) {
        // TODO: 구매하기
        print("구매하기 탭했어여!")
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        setUI()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "\(itemDocument!.name)"
        self.view.bringSubviewToFront(self.fixView)
        self.tabBarController?.tabBar.isHidden = true
        setData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let ExplanationVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemExplanationSB") as! ItemExplanationViewController
        ExplanationVC.tabName = "상품설명"
        ExplanationVC.itemDocument = self.itemDocument
        
        let DetailInfoVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailInfoSB") as! ItemDetailInfoViewController
        DetailInfoVC.tabName = "상세정보"
        DetailInfoVC.itemDocument = self.itemDocument
        
        
        let ReviewVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemReviewSB") as! ItemReviewViewController
        ReviewVC.tabName = reviewCnt != nil ? "후기" + "\(String(describing: reviewCnt))" : "후기"

        
        let QuestionVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemQuestionSB") as! ItemQuestionViewController
        QuestionVC.tabName = "문의"
        
        
        
        return [ExplanationVC, DetailInfoVC, ReviewVC, QuestionVC]
    }
    
    
    // MARK: - Function
    func setUI(){
        customButton(presentBtn, cornerValue: 5, btnBorderColor: UIColor.mainKurlyPurple, btnBorderWidth: 1)
        self.title = "아이템이름"
        customNavigationBarAttribute(.white, .black)
        customNaviBarItem2(btnColor: .black, naviItem: self.navigationItem)
        
        removeLine(self.navigationController!)
        naviTitleDelete(navi: self.navigationController!)
        customBtnBar()
        customButton(heartBtn, cornerValue: 5, btnBorderColor: UIColor.lightGray, btnBorderWidth: 1)
        customButton(buyBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
        
    }
    
    /* API 해당 부분 */
    func setData(){
        if itemDocument?.present == 0 {
            print("dia")
            presentBtn.isHidden = true
        } else {
            print("만ㅇㄹ")
            presentBtn.isHidden = false
        }
    }
    
    // TODO: 이 상품에 해당하는 후기 API를 받아와서 후기의 개수를 출력해야될듯
    
    
    func customBtnBar(){
        
        settings.style.buttonBarItemBackgroundColor = .white  // 바버튼 배경색
        settings.style.selectedBarBackgroundColor = purpleInspireColor // 바버튼 색상
        
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        
        settings.style.buttonBarMinimumLineSpacing = 0 // 바버튼 사이의 간격
        settings.style.buttonBarLeftContentInset = 20  // 가장 왼쪽 바버튼 간격
        settings.style.buttonBarRightContentInset = 20 // 가장 오른쪽 바버튼 간격
        
        settings.style.buttonBarItemsShouldFillAvailableWidth = true // 바너비를 동일하게 적용하는 듯?

        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
        guard changeCurrentIndex == true else { return }
        oldCell?.label.textColor = .lightGray
        newCell?.label.textColor = self?.purpleInspireColor
        }
    }
}

