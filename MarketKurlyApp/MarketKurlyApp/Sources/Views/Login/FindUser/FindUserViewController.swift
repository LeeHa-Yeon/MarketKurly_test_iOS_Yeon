//
//  FindUserViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class FindUserViewController: UIViewController {
    
    // MARK: - UIComponents
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func firstBtnTapped(_ sender: Any) {
        secondBtn.setTitleColor(UIColor.gray, for: .normal)
        firstBtn.setTitleColor(UIColor.mainKurlyPurple, for: .normal)
        firstView.alpha = 1
        secondView.alpha = 0
    }
    
    @IBAction func secondBtnTapped(_ sender: Any) {
        firstBtn.setTitleColor(UIColor.gray, for: .normal)
        secondBtn.setTitleColor(UIColor.mainKurlyPurple, for: .normal)
        firstView.alpha = 0
        secondView.alpha = 1
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setInit()
        customNavigationBarAttribute(.white, .black)
    }
    
    // MARK: - Functions
    func setInit(){
        if "idFindStatus" == UserDefaults.standard.string(forKey: Constant.findStatusName) {
            self.title = "아이디 찾기"
        }else {
            self.title = "비밀번호 찾기"
        }
        
    }
}
