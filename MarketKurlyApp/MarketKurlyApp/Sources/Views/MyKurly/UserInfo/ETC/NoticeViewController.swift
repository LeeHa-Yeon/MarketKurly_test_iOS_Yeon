//
//  NoticeViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit
import GSMessages

class NoticeViewController: UIViewController {
    
    // MARK: - Components
    @IBOutlet weak var adSwitch: UISwitch!
    @IBOutlet weak var nightSwitch: UISwitch!
    @IBAction func adSwitchTapped(_ sender: Any) {

        if self.adSwitch.isOn {
            self.alertMessage(message: "마켓컬리의 광고성 정보 받기에 동의하셨습니다. \n \(self.todayDateToString())")
            return }
        self.adSwitch.setOn(true, animated: true)
        let alert = UIAlertController(title: "알림 설정", message: "혜택 정보를 수신하는 분들이 \n평균 4% 저렴하게 구매하고 계세요.\n 그래도 알림을 끄시겠어요?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "알림 끄기", style: .cancel, handler: { _ in
            self.adSwitch.setOn(false, animated: true)
            self.alertMessage(message: "마켓컬리의 광고성 정보 받기를 거부하셨습니다.\n \(self.todayDateToString())")
        }))
        alert.addAction(UIAlertAction(title: "알림 유지", style: .default, handler: { _ in

        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func nightSwitchTapped(_ sender: Any) {
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
    
    func alertMessage(message: String){
        showMessage(message, type: .success, options: [
            .margin(.init(top: 10, left: 10, bottom: 0, right: 10)),
            .cornerRadius(5),
            .textAlignment(.left),
            .textColor( UIColor.mainKurlyPurple ),
            .textNumberOfLines(2),
            .height(80)
        ])
    }
    func todayDateToString() -> String {
        let date = Date()
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy.MM.dd"
        let msg = formatter.string(from: date)
        return msg
    }
    
}
