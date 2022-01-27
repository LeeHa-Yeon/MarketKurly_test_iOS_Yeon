//
//  OrderSheetFifthCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

// 쿠폰 적립금
class OrderSheetFifthCell: UITableViewCell {
    
    let userInfoManager = UserInfoManaer.shared
    var myAllPoint: Int = 0
    
    // MARK: - Components
    @IBOutlet weak var couponTextField: UITextField!
    
    @IBOutlet weak var allUsebtn: UIButton!
    
    @IBOutlet weak var usePointTextField: UITextField!
    
    @IBOutlet weak var currentUsePoint: UILabel!
    
    @IBAction func allUseTapped(_ sender: Any) {
        usePointTextField.text = "\(myAllPoint)"
    }
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setData()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func setUI(){
        allUsebtn.layer.cornerRadius = 5
        allUsebtn.layer.borderWidth = 1
        allUsebtn.layer.borderColor = UIColor.lineColor.cgColor
    }
    
    /* API 통신 */
    func setData(){
        guard let pointInfo = userInfoManager.getUserPointListInfo()?.points else {
            return
        }
        currentUsePoint.text = "사용가능 적립금 \(DecimalWon(value: pointInfo))"
        myAllPoint = pointInfo
    }
}
