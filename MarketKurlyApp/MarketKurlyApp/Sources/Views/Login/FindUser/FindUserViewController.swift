//
//  FindUserViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class FindUserViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
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
    
    func setInit(){
        if "idFindStatus" == UserDefaults.standard.string(forKey: Constant.findStatusName) {
            self.title = "아이디 찾기"
        }else {
            self.title = "비밀번호 찾기"
        }
    }
    

}
