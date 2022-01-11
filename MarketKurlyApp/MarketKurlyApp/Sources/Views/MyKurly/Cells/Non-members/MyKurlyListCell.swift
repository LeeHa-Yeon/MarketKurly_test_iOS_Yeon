//
//  MyKurlyListCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class MyKurlyListCell: UITableViewCell {
    
    // MARK: - UIComponents
    @IBOutlet weak var listNameLabel: UILabel!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        listNameLabel.text = ""
    }
}
