//
//  ItemImgUrlCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//
// "item_details_img_url": "https://i.ibb.co/TTQhmV2/047e9de093bf48d2953e8b2d64a95120.png"

import UIKit
import Kingfisher

class ItemImgUrlCell: UITableViewCell {
    
    // MARK: - Components
    
    @IBOutlet weak var imageDetailImgView: UIImageView!
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        urlToImg()
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func urlToImg(){
        if let url: URL = URL(string: "https://i.ibb.co/TTQhmV2/047e9de093bf48d2953e8b2d64a95120.png" ){
            imageDetailImgView.kf.indicatorType = .activity
            imageDetailImgView.kf.setImage(with:url)
        }
    }
    
    
}
