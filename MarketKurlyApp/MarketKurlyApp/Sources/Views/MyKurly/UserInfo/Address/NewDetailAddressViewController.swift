//
//  NewDetailAddressViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit

class NewDetailAddressViewController: UIViewController {

    // MARK: - Components
    @IBOutlet weak var saveBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        dismissKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        customButton(saveBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
    }
}
