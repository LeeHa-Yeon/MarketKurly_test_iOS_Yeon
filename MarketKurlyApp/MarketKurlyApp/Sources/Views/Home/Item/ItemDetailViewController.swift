//
//  ItemDetailViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/14.
//

import UIKit
import XLPagerTabStrip

class ItemDetailViewController: ButtonBarPagerTabStripViewController {
    
    let purpleInspireColor = UIColor.mainKurlyPurple
    let reviewCnt: Int? = nil
    
    // MARK: - Components

    // MARK: - LifeCycle
    override func viewDidLoad() {
        setUI()
        
        super.viewDidLoad()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let ExplanationVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemExplanationSB") as! ItemExplanationViewController
        ExplanationVC.tabName = "상품설명"
        
        let DetailInfoVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailInfoSB") as! ItemDetailInfoViewController
        DetailInfoVC.tabName = "상세정보"
        
        
        let ReviewVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemReviewSB") as! ItemReviewViewController
        ReviewVC.tabName = reviewCnt != nil ? "후기" + "\(String(describing: reviewCnt))" : "후기"

        
        let QuestionVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemQuestionSB") as! ItemQuestionViewController
        QuestionVC.tabName = "문의"
        
        
        
        return [ExplanationVC, DetailInfoVC, ReviewVC, QuestionVC]
    }
    
    
    // MARK: - Function
    func setUI(){
        customNavigationBarAttribute(.white, .black)
        self.bgKurlyColor(self.navigationController!, self.navigationItem, title: "아이템이름")
        customBtnBar()
    }
    
    /* API 해당 부분 */
    // TODO: 이 상품에 해당하는 후기 API를 받아와서 후기의 개수를 출력해야될듯
    func setData(){
        
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

