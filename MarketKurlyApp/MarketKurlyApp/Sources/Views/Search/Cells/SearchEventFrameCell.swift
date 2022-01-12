//
//  SearchEventFrameCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/12.
//

import UIKit

class SearchEventFrameCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var searchTitle: UILabel!
    @IBOutlet weak var eventBannerBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
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
        eventBannerBtn.layer.cornerRadius = 5
        eventBannerBtn.backgroundColor = .clear
    }
}
