//
//  SearchResultViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/12.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    // MARK: - Components
    @IBOutlet weak var noSearchView: UIView!
    @IBOutlet weak var resultSearchView: UIView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        // MARK: - delegate으로 나중에 구현하기
        noSearchView.alpha = 0
        resultSearchView.alpha = 1
    }

}
