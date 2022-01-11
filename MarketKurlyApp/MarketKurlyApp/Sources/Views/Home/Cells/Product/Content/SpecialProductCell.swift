//
//  SpecialProductCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class SpecialProductCell: UITableViewCell {
    
    // MARK: - UIComponents
    @IBOutlet weak var specialTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var productPointLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var originPriceLabel: UILabel!
    
    @IBAction func cartTapped(_ sender: Any) {
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
