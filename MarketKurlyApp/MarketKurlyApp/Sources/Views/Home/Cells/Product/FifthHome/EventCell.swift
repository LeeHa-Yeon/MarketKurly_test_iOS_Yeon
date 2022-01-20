//
//  EventCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class EventCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var eventBannerImg: UIImageView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        eventBannerImg.contentMode = .scaleToFill
        eventBannerImg.clipsToBounds = true
    }
}
