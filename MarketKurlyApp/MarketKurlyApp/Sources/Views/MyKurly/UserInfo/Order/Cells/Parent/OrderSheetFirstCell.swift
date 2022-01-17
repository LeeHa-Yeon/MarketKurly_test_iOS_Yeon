//
//  OrderSheetFirstCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

// 주문상품
class OrderSheetFirstCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCnt: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    
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
