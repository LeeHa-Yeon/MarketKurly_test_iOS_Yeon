//
//  LodingViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

import UIKit

class LodingViewController: UIViewController {
    
    // MARK: - Components
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //2-3초 뒤에 작동하게끔.
        moveToVC()
    }
    
    // MARK: - Functions
    func setUI(){
        
    }
    
    func moveToVC(){
        let time = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: time) {
            
            let board = UIStoryboard(name: "Main", bundle: nil)
            let vc = board.instantiateViewController(withIdentifier: "rootTabBarSB")
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true, completion: nil)
            
        }
    }
    
    
    
}
