//
//  ShowOrderListViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit

class ShowOrderListViewController: UIViewController {
    
    let dummyListName = ["주문번호 16543534523","","결제정보","주문정보","배송정보","추가정보"]
    let dummyStatus = ["냉장","냉장","냉동","냉동","상온"]
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    // MARK: - Functions
    func setUI(){
        naviTitleDelete(navi: self.navigationController!)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
}


extension ShowOrderListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1 :
            return dummyStatus.count
        default :
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0,2,3,4,5 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderContentListCell", for: indexPath) as? OrderContentListCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = dummyListName[indexPath.section]
            cell.selectionStyle = .none
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderContentFreshCell", for: indexPath) as? OrderContentFreshCell else {
                return UITableViewCell()
            }
            if indexPath.row == dummyStatus.count-1 {
                cell.isLast = true
            }
            cell.statusLabel.text = dummyStatus[indexPath.row]
            cell.selectionStyle = .none
            return cell
        case 6 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderListBottomCell", for: indexPath) as? OrderListBottomCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}



class OrderContentListCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    
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
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
}

class OrderContentFreshCell: UITableViewCell {
    
    var isLast: Bool = false
    
    // MARK: - Components
    @IBOutlet weak var statusLabel: UILabel!
    
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
        if isLast {
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        }
    }

    
}

class OrderListBottomCell: UITableViewCell {
    
    
    
    // MARK: - Components
    @IBOutlet weak var cancleBtn: UIButton!
    
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
        cancleBtn.layer.borderWidth = 1
        cancleBtn.layer.borderColor = UIColor.lineColor.cgColor
        cancleBtn.layer.cornerRadius = 5
    }
}
