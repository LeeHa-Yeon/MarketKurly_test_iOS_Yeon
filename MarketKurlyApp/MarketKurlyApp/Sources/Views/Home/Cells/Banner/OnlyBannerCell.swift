//
//  OnlyBannerCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class OnlyBannerCell: UITableViewCell {
    
    @IBOutlet weak var bannerBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        bannerBtn.imageView?.contentMode = .scaleToFill
        bannerBtn.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
