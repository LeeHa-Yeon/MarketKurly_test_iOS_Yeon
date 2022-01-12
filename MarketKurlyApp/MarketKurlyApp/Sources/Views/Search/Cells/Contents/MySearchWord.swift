//
//  MySearchWord.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class MySearchWord: UICollectionViewCell {
    
    // MARK: - Components
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchLabel: UILabel!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        searchView.layer.cornerRadius = 16
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = #colorLiteral(red: 0.9567895532, green: 0.9569039941, blue: 0.9567505717, alpha: 1)
        searchView.layer.masksToBounds = true
    }
}
