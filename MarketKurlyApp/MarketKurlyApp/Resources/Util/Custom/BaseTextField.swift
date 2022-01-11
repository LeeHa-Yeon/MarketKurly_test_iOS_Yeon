//
//  BaseTextField.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

@IBDesignable
class BaseTextField: UITextField {
    

    @IBInspectable var leftimage : UIImage?{
        didSet{
            updateTextField()
        }
    }
    
    @IBInspectable var leftMargin : CGFloat = 0 {
        didSet{
            updateTextField()
        }
    }
    
    @IBInspectable var viewColor : UIColor? {
        didSet{
            updateTextField()
        }
    }
    
    @IBInspectable var imageTintColor : UIColor? {
        didSet{
            updateTextField()
        }
    }
    
    
    @IBInspectable var viewWidth : CGFloat = 0 {
        didSet{
            updateTextField()
        }
    }
    
    @IBInspectable var viewHeight : CGFloat = 0 {
        didSet{
            updateTextField()
        }
    }
    
    
    func updateTextField(){
        guard let image = leftimage else {
            leftViewMode = .never
            return
        }
        
        leftViewMode = .always
        
        var viewWidth = leftMargin + self.viewWidth
        
        if borderStyle == .none || borderStyle == .line {
            viewWidth += 5
        }
        //이미지를 담을 View 생성 - 마진을 위해서
        let insideView = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth , height: viewHeight))
        insideView.backgroundColor = viewColor
        
        //이미지 뷰
        let insideImageView = UIImageView(frame: CGRect(x: leftMargin, y: 0, width: self.viewWidth, height: viewHeight))
        insideImageView.image = image
        insideImageView.tintColor = imageTintColor
        insideView.addSubview(insideImageView)
        
        //leftView = 왼쪽 텍스티 필드의 view
        leftView = insideView
        
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : tintColor!])
        
    }
    
}
