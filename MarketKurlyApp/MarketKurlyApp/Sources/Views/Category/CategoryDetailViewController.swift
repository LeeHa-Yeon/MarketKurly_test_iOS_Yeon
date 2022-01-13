//
//  CategoryDetailViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/13.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavigationBarAttribute(.white, .black)
    }

}
