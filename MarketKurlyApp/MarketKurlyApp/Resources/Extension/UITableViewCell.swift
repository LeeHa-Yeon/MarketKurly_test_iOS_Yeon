//
//  UITableViewCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit
import Kingfisher

extension UITableViewCell {
    
    func cancleLine(text: String, targetLabel: UILabel){
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.strikethroughStyle, value: 1.07, range: (text as NSString).range(of: text))
        targetLabel.attributedText = attributedString
    }
    
    // MARK: - 세자리 숫자마다 콤마 넣기
    func DecimalWon(value: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
        
        return result
    }
    
    func urlToImg(urlStr: String, targetImg: UIImageView ){
        if let url: URL = URL(string: urlStr){
            targetImg.kf.indicatorType = .activity
            targetImg.kf.setImage(with:url)
        }
    }
    
}

