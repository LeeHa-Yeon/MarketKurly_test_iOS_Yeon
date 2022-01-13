//
//  MyKurlyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class MyKurlyViewController: UIViewController {
    
    var isJwt: String?
    
    //MARK: - UIComponents
    @IBOutlet weak var noMemberView: UIView!
    @IBOutlet weak var memberView: UIView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBarAttribute(UIColor.mainKurlyPurple, .white)
        setUI()
    }
    
    //MARK: - Functions
    func setUI(){
        isJwt = UserDefaults.standard.string(forKey: Constant.jwtName)!
        if isJwt == nil || isJwt == "" {
            noMemberView.alpha = 1
            memberView.alpha = 0
        } else {
            noMemberView.alpha = 0
            memberView.alpha = 1
        }
    }
    
}
