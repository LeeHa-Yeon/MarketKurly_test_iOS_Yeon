//
//  File.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class MyKurlyInfoCell: UITableViewCell {
    
    var delegate: LevelViewControllerDelegate?
    
    // MARK: - UIComponents
    @IBOutlet weak var rankBtn: UIButton!
    @IBOutlet weak var allRankBtn: UIButton!
    @IBOutlet weak var nextRankBtn: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointRate: UILabel!
    
    @IBAction func allLevelTapped(_ sender: Any) {
        self.delegate?.moveToAllLevelVC()
    }
    
    @IBAction func nextLevelTapped(_ sender: Any) {
        self.delegate?.moveToNextLevelVC()
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        rankBtn.layer.cornerRadius = 3
        rankBtn.layer.borderWidth = 1
        rankBtn.layer.borderColor = UIColor.mainKurlyPurple.cgColor
        allRankBtn.layer.cornerRadius = 20
        nextRankBtn.layer.cornerRadius = 20
    }
    
}
