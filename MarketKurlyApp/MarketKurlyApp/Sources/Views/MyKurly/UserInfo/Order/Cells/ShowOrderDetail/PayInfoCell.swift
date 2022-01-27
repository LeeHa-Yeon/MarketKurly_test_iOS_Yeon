//
//  PayInfoCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

class PayInfoCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var deliveryPrice: UILabel!
    @IBOutlet weak var usePointPrice: UILabel!
    @IBOutlet weak var payPrice: UILabel!
    @IBOutlet weak var accumulatePoint: UILabel!
    
    
    
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
