//
//  OrderSheetThirdCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

// 배송지
class OrderSheetThirdCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var standardAddressImg: UIImageView!
    @IBOutlet weak var mainAddress: UILabel!
    @IBOutlet weak var detailAddress: UILabel!
    @IBOutlet weak var blankView: UIView!
    @IBOutlet weak var fullView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recivePlaceLabel: UILabel!
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var modifyBtn: UIButton!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func setUI(){
        modifyBtn.layer.borderColor =
        UIColor.lineColor.cgColor
        modifyBtn.layer.borderWidth = 1
        modifyBtn.layer.cornerRadius = 5
        blankView.layer.addBorder([.top, ], color: UIColor.lineColor, width: 1.0)
        fullView.layer.addBorder([.top, ], color: UIColor.lineColor, width: 1.0)
        
        standardAddressImg.isHidden = true
        blankView.isHidden = true
    }
}
