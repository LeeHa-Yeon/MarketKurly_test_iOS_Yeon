//
//  OnlyBannerCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class OnlyBannerCell: UITableViewCell {
    
    // MARK: - UIComponents
    @IBOutlet weak var bannerBtn: UIButton!

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerBtn.imageView?.contentMode = .scaleToFill
        bannerBtn.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
