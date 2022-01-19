//
//  UITableViewCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit

extension UITableViewCell {
    
    func cancleLine(text: String, targetLabel: UILabel){
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.strikethroughStyle, value: 1.07, range: (text as NSString).range(of: text))
        targetLabel.attributedText = attributedString
    }

}

