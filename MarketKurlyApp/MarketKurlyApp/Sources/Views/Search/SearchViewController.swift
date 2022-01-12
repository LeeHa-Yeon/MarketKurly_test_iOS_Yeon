//
//  SearchViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Components
    @IBOutlet weak var searchTextField: BaseTextField!
    @IBOutlet weak var beforeSearchView: UIView!
    @IBOutlet weak var afterSearchView: UIView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - Function
    func setUI(){
        searchTextField.layer.cornerRadius = 5
        self.bgKurlyColor(self.navigationController!, self.navigationItem, title: "검색")
        
    }
    
    // MARK: - objc Functions
    @objc func textFieldDidChange(_ sender: Any?) {
        if searchTextField.text == "" {
            print("wefq")
            beforeSearchView.alpha = 1
            afterSearchView.alpha = 0
        }else {
            print("dfasd")
            beforeSearchView.alpha = 0
            afterSearchView.alpha = 1
        }
    }
}
