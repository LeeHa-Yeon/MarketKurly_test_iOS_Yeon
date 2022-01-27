//
//  PointViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit

class PointViewController: UIViewController {
    
    let userInfoManager = UserInfoManaer.shared
    var userPointList:[UserPointDocument] = []
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!

    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Functions
    func setUI(){
        naviTitleDelete(navi: self.navigationController!)
        customNavigationBarAttribute(.white, .black)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /* API 통신 */
    func setData(){
        guard let userPointList = userInfoManager.getUserPointListInfo()?.userPoint else {
            return
        }
        self.userPointList = userPointList
        tableView.reloadData()
    }
}

extension PointViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
            
        case 1 :
            return userPointList.count
        default :
            assert(false,"놉")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "pointHeaderCell", for: indexPath) as? PointHeaderCell else {
                return UITableViewCell()
            }
            cell.currentPoint.text = DecimalWon(value: userInfoManager.getUserPointListInfo()?.points ?? 0)
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "pointContentCell", for: indexPath) as? PointContentCell else {
                return UITableViewCell()
            }
            let target = userPointList[indexPath.row]
            cell.orderPointName.text = "[구매적립] 주문(\(target.orderId))\n\(userInfoManager.getUserLevelInfo()!.pointsRate*10)% 적립"
            let targetDate = target.usedDate.substring(from: 0, to: 10)
            cell.pointDate.text = targetDate
            
            if target.is_used == 1 {
                cell.point.text = "+ \(DecimalWon(value: target.used_points))"
            }else {
                cell.point.text = "- \(DecimalWon(value: target.used_points))"
            }
            
            return cell
        default :
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 120
        case 1 :
            return 100
        default :
            return UITableView.automaticDimension
            
        }
    }
    
}


class PointHeaderCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var currentPoint: UILabel!
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 8, right: 0))
    }
    
}

class PointContentCell: UITableViewCell {
    
    // MARK: - Components
    
    @IBOutlet weak var orderPointName: UILabel!
    @IBOutlet weak var pointDate: UILabel!
    @IBOutlet weak var point: UILabel!
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0))
    }
}
