//
//  HomeViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit
import XLPagerTabStrip

class ParentViewController: ButtonBarPagerTabStripViewController {
    
    let purpleInspireColor = UIColor.mainKurlyPurple
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        UserDefaults.standard.set(false, forKey: Constant.loginStatusName)
        customBtnBar()
        setUI()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "마켓컬리"
        customNavigationBarAttribute(UIColor.mainKurlyPurple, .white)
        customNaviBarItem(btnColor: .white, naviItem: self.navigationItem)
//        setUI()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let RecommendVC = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "RecommendSB") as! RecommendViewController
        RecommendVC.tabName = "컬리추천"
        
        
        let NewProductVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "NewProductSB") as! NewProductViewController
        NewProductVC.tabName = "신상품"
        
        let BestVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "BestSB") as! BestViewController
        BestVC.tabName = "베스트"
        
        let ThriftyShoppingVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ThriftyShoppingSB") as! ThriftyShoppingViewController
        ThriftyShoppingVC.tabName = "알뜰쇼핑"
        
        let SpecialPriceVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SpecialPriceSB") as! SpecialPriceViewController
        SpecialPriceVC.tabName = "특가/혜택"
        
        
        return [RecommendVC, NewProductVC, BestVC, ThriftyShoppingVC, SpecialPriceVC]
    }
    
    
    // MARK: - Function
    func setUI(){
        print("왜안먹는뎅...")
        self.bgKurlyColor(self.navigationController!, self.navigationItem, title: "마켓컬리")
        customNaviBarItem(btnColor: .white, naviItem: self.navigationItem)
    }
    
    
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

