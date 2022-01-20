//
//  CategoryItemCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/13.
//

import UIKit

class CategoryParentCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryImg: UIImageView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Fucntions
    func setUI(){
        categoryImg.contentMode = .scaleToFill
    }
}
