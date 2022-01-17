//
//  AddressDetailMoreViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit

class AddressDetailMoreViewController: UIViewController {

    // MARK: - Components
    @IBOutlet weak var recievePlace1Content: UIView!
    @IBOutlet weak var recievePlace2Content: UIView!
    @IBOutlet weak var recievePlace3Content: UIView!
    @IBOutlet weak var recievePlace4Content: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func recivePlace1(_ sender: Any) {
        recievePlace1Content.isHidden = false
        recievePlace2Content.isHidden = true
        recievePlace3Content.isHidden = true
        recievePlace4Content.isHidden = true
    }
    @IBAction func recivePlace2(_ sender: Any) {
        recievePlace1Content.isHidden = true
        recievePlace2Content.isHidden = false
        recievePlace3Content.isHidden = true
        recievePlace4Content.isHidden = true
        
    }
    @IBAction func recivePlace3(_ sender: Any) {
        recievePlace1Content.isHidden = false
        recievePlace2Content.isHidden = true
        recievePlace3Content.isHidden = false
        recievePlace4Content.isHidden = true
    }
    @IBAction func recivePlace4(_ sender: Any) {
        recievePlace1Content.isHidden = true
        recievePlace2Content.isHidden = true
        recievePlace3Content.isHidden = true
        recievePlace4Content.isHidden = false
    }
    
        
        // MARK: - LifeCycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setUI()
        }
        
        // MARK: - Functions
        func setUI(){
            dismissKeyboardWhenTappedAround()
            naviTitleDelete(navi: self.navigationController!)
            recievePlace1Content.isHidden = false
            recievePlace2Content.isHidden = true
            recievePlace3Content.isHidden = true
            recievePlace4Content.isHidden = true
            customButton(saveBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
            self.title = "배송정보"
            customNavigationBarAttribute(.white, .black)
        }

}
