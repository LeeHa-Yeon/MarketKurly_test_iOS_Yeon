//
//  AfterOrderViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit

class AfterOrderViewController: UIViewController {
    
    var isFirstOrder: Int = 1
    
    // MARK: - Components
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var orderPriceLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var firstOrderCouponView: UIView!
    @IBOutlet weak var moveToHomeBtn: UIButton!
    @IBOutlet weak var showOrderBtn: UIButton!
    
    @IBAction func moveToHomeTapped(_ sender: Any) {
        // TODO: - 홈 화면으로 가기
    }
    @IBAction func moveToOrderListTapped(_ sender: Any) {
        // TODO: - 주문 내역 상세보기로 이동
        
        
        
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
    
    // MARK: - Functions
    func setUI(){
        customView(firstOrderCouponView, cornerValue: nil, viewBorderColor: .systemGray3, viewBorderWidth: 1)
        customButton(moveToHomeBtn, cornerValue: 5, btnBorderColor: nil, btnBorderWidth: nil)
        customButton(showOrderBtn, cornerValue: 5, btnBorderColor: UIColor.lineColor, btnBorderWidth: 1)
    }
    
    func isFirstConfirm(){
        if isFirstOrder == 0 {
            firstOrderCouponView.isHidden = false
            setData_coupon()
        } else {
            firstOrderCouponView.isHidden = true
        }
    }
    
    /* API 통신 부분 */
    // 쿠폰 지급해야된다.
    func setData_coupon(){
        
    }
    
    func setData(){
        
        
        
        isFirstConfirm()
    }
    
    
}
