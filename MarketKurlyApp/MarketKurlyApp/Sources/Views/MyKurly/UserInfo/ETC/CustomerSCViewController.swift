//
//  customerSCViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit

class CustomerSCViewController: UIViewController {
    
    // MARK: - Components
    @IBAction func phoneService(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle:  UIAlertController.Style.actionSheet)
    
        let okAction = UIAlertAction(title: "통화 1644-1107", style: .default) { (action) in
                    print("전화연결")
                }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func orderService(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle:  UIAlertController.Style.actionSheet)
    
        let okAction = UIAlertAction(title: "통화 1644-1108", style: .default) { (action) in
                    print("전화연결")
                }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func kakaoQuestion(_ sender: Any) {
        let alert = UIAlertController(title: "카카오톡 문의", message: "카카오톡으로 이동하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
                    
                }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: false, completion: nil)
        
    }
    @IBAction func OneToOneQuestion(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "ETC", bundle: nil)
        let OneToOneNotionVC = storyboard.instantiateViewController(identifier: "OneToOneNotionSB")
        self.present(OneToOneNotionVC, animated: true, completion: nil)
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

    }
    
}
