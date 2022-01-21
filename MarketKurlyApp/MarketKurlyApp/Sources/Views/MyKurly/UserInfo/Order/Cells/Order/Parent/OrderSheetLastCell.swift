//
//  OrderSheetLastCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit



// 결제 진행 필수 동의
class OrderSheetLastCell: UITableViewCell {
    
    var delegate :testDelegate?
    
    // MARK: - Components
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.moveToVC()
//
    }
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
        
    }
}

