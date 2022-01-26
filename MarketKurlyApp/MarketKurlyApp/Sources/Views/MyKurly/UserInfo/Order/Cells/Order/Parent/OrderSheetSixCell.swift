//
//  OrderSheetSixCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

// 결제 수단
class OrderSheetSixCell: UITableViewCell {
    
    var payIdx = 2
    
    // MARK: - Components
    @IBAction func kakaoPayBtn(_ sender: Any) {
        payIdx = 1
    }
    @IBAction func naverPayBtn(_ sender: Any) {
        payIdx = 2
    }
    
    @IBAction func checkBtnTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    
    
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
        
    }
}
