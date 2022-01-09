//
//  SearchViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    func setUI(){
        self.bgKurlyColor(self.navigationController!, self.navigationItem, title: "검색")
        
    }
}
