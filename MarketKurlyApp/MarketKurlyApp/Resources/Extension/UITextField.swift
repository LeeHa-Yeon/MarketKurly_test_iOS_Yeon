//
//  UITextField.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

extension UITextField {
    
    func addLeftPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
                                 
}
