//
//  RecipeCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class RecipeCell: UICollectionViewCell {

    @IBOutlet weak var RecipeBtn: UIButton!
    @IBOutlet weak var cookTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        RecipeBtn.imageView?.contentMode = .scaleToFill
        // Initialization code
    }

    
}
