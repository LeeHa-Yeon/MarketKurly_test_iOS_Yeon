//
//  OrderSheetFifthCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

// 쿠폰 적립금
class OrderSheetFifthCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var couponTextField: UITextField!
    
    @IBOutlet weak var allUsebtn: UIButton!
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func setUI(){
        allUsebtn.layer.cornerRadius = 5
        allUsebtn.layer.borderWidth = 1
        allUsebtn.layer.borderColor = UIColor.lineColor.cgColor
    }
}
