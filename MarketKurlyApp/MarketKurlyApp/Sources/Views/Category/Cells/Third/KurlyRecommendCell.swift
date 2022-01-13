//
//  KurlyRecommendCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/13.
//

import UIKit

class KurlyRecommendCell: UICollectionViewCell {
    // MARK: - Components
    @IBOutlet weak var cateImg: UIImageView!
    @IBOutlet weak var cateName: UILabel!
    @IBOutlet weak var nameView: UIView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        nameView.layer.borderWidth = 1
        nameView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
}
