//
//  RecipeCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class RecipeCell: UICollectionViewCell {

    // MARK: - UIComponents
    @IBOutlet weak var RecipeBtn: UIButton!
    @IBOutlet weak var cookTitleLabel: UILabel!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        RecipeBtn.imageView?.contentMode = .scaleToFill
    }
}
