//
//  ItemMainCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit
import Kingfisher

class ItemMainCell: UITableViewCell {
    
    var delegate: ShareViewControllerDelegate?
    
    // MARK: - Components
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemSubNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var userLevelLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    @IBOutlet weak var couponButton: UIButton!
    
    @IBAction func shareBtnTapped(_ sender: Any) {
        self.delegate?.moveToVC()
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        urlToImg()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    
    func setUI(){
        couponButton.layer.borderWidth = 1
        couponButton.layer.borderColor = UIColor.mainKurlyPurple.cgColor
        couponButton.layer.cornerRadius = 5
    }
    
    func urlToImg(){
        if let url: URL = URL(string: "https://i.postimg.cc/zvtZm349/1.png" ){
            itemImg.kf.indicatorType = .activity
            itemImg.kf.setImage(with:url)
        }
    }
    
}
