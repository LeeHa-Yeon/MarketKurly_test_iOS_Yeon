//
//  MyKurlyListPlusCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class MyKurlyListPlusCell: UITableViewCell {
    
    // MARK: - UIComponents
    @IBOutlet weak var listNameLable: UILabel!
    @IBOutlet weak var subStrLabel: UILabel!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        listNameLable.text = ""
        subStrLabel.text = ""
    }
}
