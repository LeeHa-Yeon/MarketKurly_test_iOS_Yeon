//
//  EventCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class EventCell: UITableViewCell {
    
    var eventId: Int?
    var delegate: EventViewControllerDelegate?
    
    // MARK: - Components
    @IBOutlet weak var eventBanner: UIButton!
    @IBAction func bannerTapped(_ sender: Any) {
        self.delegate?.moveToVC(id: eventId ?? 0)
    }
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        eventBanner.imageView?.contentMode = .scaleToFill
        eventBanner.clipsToBounds = true
    }
}
