//
//  SearchViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Components
    @IBOutlet weak var searchTextField: BaseTextField! {
        didSet{
            searchTextField.delegate = self
        }
    }
    @IBOutlet weak var beforeSearchView: UIView!
    @IBOutlet weak var afterSearchView: UIView!
    @IBOutlet weak var searchResultView: UIView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        dismissKeyboardWhenTappedAround()
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
            beforeSearchView.alpha = 1
            afterSearchView.alpha = 0
            searchResultView.alpha = 0
        }else {
            beforeSearchView.alpha = 0
            afterSearchView.alpha = 1
            searchResultView.alpha = 0
        }
    }
}

extension SearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      beforeSearchView.alpha = 0
      afterSearchView.alpha = 0
      searchResultView.alpha = 1
    return true
  }
}


