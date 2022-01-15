//
//  ItemBuyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit
import GMStepper

class ItemBuyViewController: UIViewController {

    // MARK: - Components
    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Functions
    func setUI(){
        customView(stepper, cornerValue: 3, viewBorderColor: #colorLiteral(red: 0.8375317454, green: 0.8376728892, blue: 0.8375131488, alpha: 1) , viewBorderWidth: 1)
        setStepper()
    }
    
    func setStepper(){
        stepper.value = 1
        stepper.minimumValue = 1
        stepper.buttonsTextColor = UIColor.black
        stepper.buttonsBackgroundColor = .clear
        stepper.buttonsFont =  UIFont ( name : "AvenirNext-Bold" , size : 14.0 )!
        stepper.labelTextColor = .black
        stepper.labelBackgroundColor = .clear
        stepper.labelFont =  UIFont ( name : "AvenirNext-Bold" , size : 14.0 )!

    }

}
