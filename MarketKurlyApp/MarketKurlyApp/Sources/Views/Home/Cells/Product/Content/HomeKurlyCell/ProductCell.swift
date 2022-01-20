//
//  ProductCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
//    var delegate: ItemBuyViewControllerDelegate?
    var itemId : Int?
    
    // MARK: - Components
    
    @IBOutlet weak var presentImg: UIImageView!
    @IBOutlet weak var couponImg: UIImageView!
    @IBOutlet weak var newYearImg: UIImageView!
    
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var cartBtn: UIButton!
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    
    
    @IBAction func cartTapped(_ sender: Any) {
//        delegate?.moveToVC()
        
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
