//
//  OrderInfoCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

class OrderInfoCell: UITableViewCell {
    
    
    // MARK: - Components
    @IBOutlet weak var orderIdx: UILabel!
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var postName: UILabel!
    @IBOutlet weak var payDate: UILabel!
    
    
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
