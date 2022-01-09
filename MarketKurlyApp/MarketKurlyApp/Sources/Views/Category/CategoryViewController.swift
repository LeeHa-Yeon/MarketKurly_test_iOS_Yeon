//
//  CategoryViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class CategoryViewController: UIViewController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    func setUI(){
        self.bgKurlyColor(self.navigationController!, self.navigationItem, title: "카테고리")
        
    }
}
