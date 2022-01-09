//
//  SpecialProductCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class SpecialProductCell: UITableViewCell {
    @IBOutlet weak var specialTitleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func cartTapped(_ sender: Any) {
    }
    @IBOutlet weak var productPointLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var originPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
