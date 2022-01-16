//
//  ModifyAddressViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit

class ModifyAddressViewController: UIViewController {

    // MARK: - Components
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        customButton(saveBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
        customButton(deleteBtn, cornerValue: 5, btnBorderColor: UIColor.lineColor, btnBorderWidth: 1)
        
    }
}
