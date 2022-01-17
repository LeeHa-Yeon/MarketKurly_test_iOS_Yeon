//
//  OrderHistoryViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit

class OrderHistoryViewController: UIViewController  {
    

    // MARK: - Components
    @IBOutlet weak var firstContainerView: UIView!
    @IBOutlet weak var secondContainerView: UIView!
    
    @IBOutlet weak var firstBtnView: UIView!
    @IBOutlet weak var secondBtnView: UIView!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    
    @IBAction func firstBtnTapped(_ sender: Any) {
        firstBtnView.layer.addBorder([.bottom], color: UIColor.mainKurlyPurple, width: 2.0)
        secondBtnView.layer.addBorder([.bottom], color: .white, width: 2.0)
        secondBtn.setTitleColor(UIColor.gray, for: .normal)
        firstBtn.setTitleColor(UIColor.mainKurlyPurple, for: .normal)
        firstContainerView.alpha = 1
        secondContainerView.alpha = 0
    }
    
    @IBAction func secondBtnTapped(_ sender: Any) {
        secondBtnView.layer.addBorder([.bottom], color: UIColor.mainKurlyPurple, width: 2.0)
        firstBtnView.layer.addBorder([.bottom], color: .white, width: 2.0)
        firstBtn.setTitleColor(UIColor.gray, for: .normal)
        secondBtn.setTitleColor(UIColor.mainKurlyPurple, for: .normal)
        firstContainerView.alpha = 0
        secondContainerView.alpha = 1
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        firstBtnView.layer.addBorder([.bottom], color: UIColor.mainKurlyPurple, width: 2.0)
        secondBtnView.layer.addBorder([ .bottom], color: .white, width: 0.0)
        super.viewDidLoad()
        
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
    
    // MARK: - Function
    func setUI(){
        self.title = "주문내역"
        customNavigationBarAttribute(.white, .black)
        customNaviBarItem2(btnColor: .black, naviItem: self.navigationItem)
        removeLine(self.navigationController!)
        naviTitleDelete(navi: self.navigationController!)
        
        
    }
    
}

