//
//  ItemInfoCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit

class ItemInfoCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var salesUnit: UILabel!
    @IBOutlet weak var weightCapacity: UILabel!
    @IBOutlet weak var shippingCategory: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var packagingType: UILabel!
    @IBOutlet weak var shelf_life: UILabel!
    @IBOutlet weak var notification: UILabel!
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
