//
//  Product2Cell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class Product2Cell: UICollectionViewCell {
    
    var delegate: ItemBuyViewControllerDelegate?
    var itemId : Int?
    
    // MARK: - Components
    
    @IBOutlet weak var giftImg: UIImageView!
    @IBOutlet weak var couponImg: UIImageView!
    @IBOutlet weak var newYearImg: UIImageView!
    
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var salePrice: UILabel!
    @IBOutlet weak var originPrice: UILabel!
    
    @IBAction func cartTapped(_ sender: Any) {
        delegate?.moveToVC()
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
