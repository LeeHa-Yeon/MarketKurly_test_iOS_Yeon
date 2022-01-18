//
//  ShowOrderListViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit
import ExpyTableView

struct DummyOrderItem1 {
    let name: String
    let price: Int
    let discountPrice: Int?
    let cnt: Int
}

class ShowOrderListViewController: UIViewController {
    
    var statusCell = [true,true,true,true,true,true,true]
    var dummyOrderItemes: [DummyOrderItem1] = []
    
    let dummyListName = ["주문번호 16543534523","","결제정보","주문정보","배송정보","추가정보"]
    let dummyStatus = ["냉장","상온"]
    
    // MARK: - Components
    @IBOutlet weak var tableView: ExpyTableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
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
        setNib()
    }
    
    func setNib(){
        registerNib(cellNibName: "OrderItemFirstCell", cellIdentifier: "orderItemFirstCell")
        registerNib(cellNibName: "PayInfoCell", cellIdentifier: "payInfoCell")
        registerNib(cellNibName: "OrderInfoCell", cellIdentifier: "orderInfoCell")
        registerNib(cellNibName: "DeliveryCell", cellIdentifier: "deliveryCell")
        registerNib(cellNibName: "AddDetailInfoCell", cellIdentifier: "addDetailInfoCell")
    }
    
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.tableView.register(newCellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    /* API 통신할 부분 */
    func setData(){
        dummyOrderItemes.append(DummyOrderItem1(name: "[KF365] 깐마늘 200g", price: 2800, discountPrice: nil, cnt: 1))
        dummyOrderItemes.append(DummyOrderItem1(name: "친환경 남해초 200g", price: 3000, discountPrice: nil, cnt: 1))
        dummyOrderItemes.append(DummyOrderItem1(name: "[쿠치나 안티카] 선 드라이드 토마토 (투토솔)", price: 41970, discountPrice: 30420, cnt: 3))
        dummyOrderItemes.append(DummyOrderItem1(name: "[한일관 X 백년가게] 등심 불고기", price: 29000, discountPrice: nil, cnt: 1))
        dummyOrderItemes.append(DummyOrderItem1(name: "[뱅앤베이커스] 버터 쿠키 클래식", price: 20000, discountPrice: 1430, cnt: 2))
    }
    
}


extension ShowOrderListViewController: ExpyTableViewDelegate, ExpyTableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return dummyOrderItemes.count + 2
        case 1 :
            return dummyStatus.count
        case 6 :
            return 1
        default :
            return 2
            
        }
    }
    
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        print("\(section)섹션")
    }
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    // 섹션 내용을 작성하는 부분
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        switch section {
        case 0,2,3,4,5 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderContentListCell") as? OrderContentListCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = dummyListName[section]
            cell.selectionStyle = .none
            cell.isLast = statusCell[section]
            cell.isLastTest()
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderContentFreshCell") as? OrderContentFreshCell else {
                return UITableViewCell()
            }
            if section == dummyStatus.count-1 {
                cell.isLast = true
            }
            cell.statusLabel.text = dummyStatus[section]
            cell.selectionStyle = .none
            return cell
        case 6 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderListBottomCell") as? OrderListBottomCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
    // 하위 셀 넣기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            if indexPath.row == dummyOrderItemes.count + 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "allReCartCell", for: indexPath) as? AllReCartCell else {
                    return UITableViewCell()
                }
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemFirstCell", for: indexPath) as? OrderItemFirstCell else {
                    return UITableViewCell()
                }
                cell.isOrder = true
                if cell.isOrder {
                    cell.itemDoneStatus.isHidden = false
                }
                return cell
            }
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "payInfoCell", for: indexPath) as? PayInfoCell else {
                return UITableViewCell()
            }
            return cell
        case 3 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderInfoCell", for: indexPath) as? OrderInfoCell else {
                return UITableViewCell()
            }
            return cell
        case 4 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "deliveryCell", for: indexPath) as? DeliveryCell else {
                return UITableViewCell()
            }
            return cell
        case 5 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addDetailInfoCell", for: indexPath) as? AddDetailInfoCell else {
                return UITableViewCell()
            }
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // 선택후 동작하는 거 여기서 하기!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        print("\(indexPath.section)섹션 \(indexPath.row)로우 선택됨")
        statusCell[indexPath.section] = !statusCell[indexPath.section]
        tableView.reloadData()
    }
    
}



class OrderContentListCell: UITableViewCell {
    
    var isLast: Bool = false
    
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
        isLastTest()
    }
    
    func isLastTest(){
        if isLast {
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
        }
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

class AllReCartCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var button: UIButton!
    
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
        button.layer.borderColor = UIColor.lineColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
    }
}
