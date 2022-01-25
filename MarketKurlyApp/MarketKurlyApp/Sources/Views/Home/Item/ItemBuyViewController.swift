//
//  ItemBuyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit
import GMStepper
import GSMessages

class ItemBuyViewController: UIViewController {
    
    var itemDocument: ItemContentDocument?
    let userInfoManager = UserInfoManaer.shared
    let cartDataManager = CartDataManager.shared
    var totalPrice: Int = 0
    var pointContent: String = ""
    
    // MARK: - Components
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var originPriceLabel: UILabel!
    
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var buyBtn: UIButton!
    
    @IBAction func buyBtnTapped(_ sender: Any) {
        guard let itemDocument = itemDocument else {
            return
        }
        
        let para: AddCartRequest = AddCartRequest(itemId: itemDocument.itemId, count: Int(stepper.value))
        cartDataManager.requestAddCart(userId: userInfoManager.getUid(), para: para) { response in
            if response.isSuccess {
                self.alertMessage(message: "장바구니에 상품을 담았습니다.")
            }
        }
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
        buyBtn.setTitle("\(DecimalWon(value: totalPrice)) 장바구니 담기", for: .normal)
        pointTransform(cnt: Int(stepper.value))
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
        pointTransform(cnt: 1)
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
    
    func alertMessage(message: String){
        showMessage(message, type: .success, options: [
            .margin(.init(top: 0, left: 0, bottom: 0, right: 0)),
            .cornerRadius(5),
            .textAlignment(.center),
            .textColor( #colorLiteral(red: 0.6685361266, green: 0, blue: 0, alpha: 1)  )
        ])
        let time = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func loadData(){
        guard let itemDocument = itemDocument else {
            return
        }
        itemNameLabel.text = itemDocument.name
        if itemDocument.discount_rate == "0%" {
            priceLabel.text = DecimalWon(value: itemDocument.price)
            
            buyBtn.setTitle("\(DecimalWon(value: itemDocument.price)) 장바구니 담기", for: .normal)
        }else {
            priceLabel.text = DecimalWon(value: itemDocument.member_discount_price)
            
            buyBtn.setTitle("\(DecimalWon(value: itemDocument.member_discount_price)) 장바구니 담기", for: .normal)
        }
    }
    
    func pointTransform(cnt: Int){
        let levelInfo = userInfoManager.getUserLevelInfo()
        guard let itemDocument = itemDocument else {
            return
        }
        guard let levelInfo = levelInfo else {
            pointLabel.text = "로그인 후, 적립해택 제공"
            return
        }
        
        if itemDocument.discount_rate == "0%" {
            let point = levelInfo.pointsRate * 0.01 * Double(itemDocument.price)
            let pointUp = round(point*pow(10,0))/pow(10,0)
            pointLabel.text = "구매시 \(Int(pointUp)*cnt)원 적립"
            originPriceLabel.isHidden = true
        }else {
            let point = levelInfo.pointsRate * 0.01 * Double(itemDocument.member_discount_price)
            let pointUp = round(point*pow(10,0))/pow(10,0)
            pointLabel.text = "구매시 \(Int(pointUp)*cnt)원 적립"
            originPriceLabel.isHidden = false
            cancleLine(text: DecimalWon(value: itemDocument.price), targetLabel: originPriceLabel)
        }
  
    }
    
}
