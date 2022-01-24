//
//  ItemBuyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit
import GMStepper

class ItemBuyViewController: UIViewController {
    
    var itemDocument: ItemContentDocument?
    var totalPrice: Int = 0
    var pointContent: String = ""

    // MARK: - Components
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var buyBtn: UIButton!
    
    @IBAction func buyBtnTapped(_ sender: Any) {
        presentAlert(title: "장바구니에 상품을 담았습니다.")
    }
    

    @IBAction func changeCntTapped(_ sender: Any) {
        
        var salePrice: Int = 0
        
        guard let itemDocument = itemDocument else {
            return
        }
        
        if itemDocument.discount_rate == "0%" {
            salePrice = itemDocument.price
        }else {
            salePrice = itemDocument.member_discount_price
        }
        
        totalPrice = Int(stepper.value * Double(salePrice))
        buyBtn.setTitle("\(totalPrice)원 장바구니 담기", for: .normal)
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
    }

    // MARK: - Functions
    func setUI(){
        customView(stepper, cornerValue: 3, viewBorderColor: #colorLiteral(red: 0.8375317454, green: 0.8376728892, blue: 0.8375131488, alpha: 1) , viewBorderWidth: 1)
        setStepper()
        contentView.layer.addBorder([.top, .bottom], color: UIColor.lineColor, width: 1.0)
        customButton(buyBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
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
    
    func loadData(){
        guard let itemDocument = itemDocument else {
            return
        }
        itemNameLabel.text = itemDocument.name
        if itemDocument.discount_rate == "0%" {
            priceLabel.text = DecimalWon(value: itemDocument.price)
            buyBtn.setTitle("\(itemDocument.price)원 장바구니 담기", for: .normal)
        }else {
            priceLabel.text = DecimalWon(value: itemDocument.member_discount_price)
            buyBtn.setTitle("\(itemDocument.member_discount_price)원 장바구니 담기", for: .normal)
        }
        
    }

}
