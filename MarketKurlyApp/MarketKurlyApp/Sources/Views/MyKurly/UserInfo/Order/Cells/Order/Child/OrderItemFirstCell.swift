//
//  OrderItemFirstCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

class OrderItemFirstCell: UITableViewCell {
    
    var isOrder: Bool = false
    
    // MARK: - Components
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemOrignPrice: UILabel!
    @IBOutlet weak var itemCnt: UILabel!
    
    @IBOutlet weak var itemDoneStatus: UILabel!
    
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
        setInit()
    }
    
    func setInit(){
        itemDoneStatus.isHidden = true
    }
}
