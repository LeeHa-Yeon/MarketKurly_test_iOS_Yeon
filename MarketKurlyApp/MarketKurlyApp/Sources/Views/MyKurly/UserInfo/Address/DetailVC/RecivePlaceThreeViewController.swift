//
//  RecivePlaceThreeViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit

class RecivePlaceThreeViewController: UIViewController {

    // MARK: - Components
        
        // MARK: - LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setUI()
        }
        
        // MARK: - Functions
        func setUI(){
            dismissKeyboardWhenTappedAround()
        }
}
