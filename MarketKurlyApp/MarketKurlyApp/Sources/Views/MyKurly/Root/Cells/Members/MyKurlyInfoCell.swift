//
//  File.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class MyKurlyInfoCell: UITableViewCell {
    
    // MARK: - UIComponents
    @IBOutlet weak var rankBtn: UIButton!
    @IBOutlet weak var allRankBtn: UIButton!
    @IBOutlet weak var nextRankBtn: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointRate: UILabel!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        rankBtn.layer.cornerRadius = 3
        rankBtn.layer.borderWidth = 1
        rankBtn.layer.borderColor = UIColor.mainKurlyPurple.cgColor
        allRankBtn.layer.cornerRadius = 20
        nextRankBtn.layer.cornerRadius = 20
    }
    
}
