//
//  OrderSheetSevenCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit

// 결제 금액
class OrderSheetSevenCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var originPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    
    @IBOutlet weak var usePointLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
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
