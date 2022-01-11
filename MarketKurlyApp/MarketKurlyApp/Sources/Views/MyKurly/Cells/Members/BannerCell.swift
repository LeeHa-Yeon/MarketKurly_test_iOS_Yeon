//
//  BannerCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class BannerCell: UITableViewCell {
    
    // MARK: - UIComponents
    @IBOutlet weak var bannerBtn: UIButton!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerBtn.imageView?.contentMode = .scaleToFill
        bannerBtn.clipsToBounds = true
    }
    
}
