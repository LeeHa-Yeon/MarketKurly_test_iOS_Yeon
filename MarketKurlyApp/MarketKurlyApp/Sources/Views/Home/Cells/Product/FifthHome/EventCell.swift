//
//  EventCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class EventCell: UITableViewCell {
    @IBOutlet weak var eventBanner: UIButton!
    
    @IBAction func bannerTapped(_ sender: Any) {
        print("탭했어요~~~")
    }
    // MARK: - 생명주기
    override func awakeFromNib() {
        super.awakeFromNib()
        eventBanner.imageView?.contentMode = .scaleToFill
        eventBanner.clipsToBounds = true
    }
}
