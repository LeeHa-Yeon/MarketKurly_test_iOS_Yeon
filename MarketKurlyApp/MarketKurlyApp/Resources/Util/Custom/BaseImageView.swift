//
//  BaseImageView.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/12.
//

import UIKit

@IBDesignable
class BaseImageView: UIImageView {
    
    @IBInspectable var imageTintColor : UIColor? {
        didSet{
            updateTextField()
        }
    }
    
    
    func updateTextField(){
        let insideImageView = UIImageView()
        insideImageView.image = image
        insideImageView.tintColor = imageTintColor
        
    }
    
}
