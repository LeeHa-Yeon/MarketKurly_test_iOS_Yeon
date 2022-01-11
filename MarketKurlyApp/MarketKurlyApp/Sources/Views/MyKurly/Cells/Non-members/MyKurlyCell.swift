//
//  MyKurlyCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class MyKurlyCell: UITableViewCell {
    
    // MARK: - UIComponents
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        loginBtn.layer.cornerRadius = 3
    }
    
}
