//
//  RootReviewViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/21.
//

import UIKit

class RootReviewViewController: UIViewController {

    //MARK: - UIComponents
    @IBOutlet weak var firstBtnView: UIView!
    @IBOutlet weak var secondBtnView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    
    @IBAction func firstBtnTapped(_ sender: Any) {
        firstBtnView.layer.addBorder([.bottom], color: UIColor.mainKurlyPurple, width: 2.0)
        secondBtnView.layer.addBorder([.bottom], color: .white, width: 2.0)
        secondBtn.setTitleColor(UIColor.gray, for: .normal)
        firstBtn.setTitleColor(UIColor.mainKurlyPurple, for: .normal)
        firstView.alpha = 1
        secondView.alpha = 0
    }
    
    @IBAction func secondBtnTapped(_ sender: Any) {
        secondBtnView.layer.addBorder([.bottom], color: UIColor.mainKurlyPurple, width: 2.0)
        firstBtnView.layer.addBorder([.bottom], color: .white, width: 2.0)
        firstBtn.setTitleColor(UIColor.gray, for: .normal)
        secondBtn.setTitleColor(UIColor.mainKurlyPurple, for: .normal)
        firstView.alpha = 0
        secondView.alpha = 1
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        firstBtnView.layer.addBorder([.bottom], color: UIColor.mainKurlyPurple, width: 2.0)
        secondBtnView.layer.addBorder([ .bottom], color: .white, width: 0.0)
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
        naviTitleDelete(navi: self.navigationController!)
        customNavigationBarAttribute(.white, .black)
        customNaviBarItem(btnColor: .black, naviItem: self.navigationItem)
    }
}
