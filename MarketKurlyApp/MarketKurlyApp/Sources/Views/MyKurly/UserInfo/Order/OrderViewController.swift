//
//  OrderViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit
import ExpyTableView


struct DummyOrderItem {
    let name: String
    let price: Int
    let discountPrice: Int?
    let cnt: Int
}


class OrderViewController: UIViewController {
    
    var statusCell = [false,false,false,false,false,false,false,false]
    var dummyOrderItemes: [DummyOrderItem] = []
    
    // MARK: - Components
    @IBOutlet weak var tableView: ExpyTableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setUI()
    }
    
    
    // MARK: - Functions
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        customNavigationBarAttribute(.white, .black)
        naviTitleDelete(navi: self.navigationController!)
        registerNib(cellNibName: "OnlyBannerCell", cellIdentifier: "onlyBannerCell")
        registerNib(cellNibName: "OrderSheetSevenCell", cellIdentifier: "orderSheetSevenCell")
        
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.tableView.register(newCellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    /* API 통신할 부분 */
    func setData(){
        dummyOrderItemes.append(DummyOrderItem(name: "[KF365] 깐마늘 200g", price: 2800, discountPrice: nil, cnt: 1))
        dummyOrderItemes.append(DummyOrderItem(name: "친환경 남해초 200g", price: 3000, discountPrice: nil, cnt: 1))
        dummyOrderItemes.append(DummyOrderItem(name: "[쿠치나 안티카] 선 드라이드 토마토 (투토솔)", price: 41970, discountPrice: 30420, cnt: 3))
        dummyOrderItemes.append(DummyOrderItem(name: "[한일관 X 백년가게] 등심 불고기", price: 29000, discountPrice: nil, cnt: 1))
        dummyOrderItemes.append(DummyOrderItem(name: "[뱅앤베이커스] 버터 쿠키 클래식", price: 20000, discountPrice: 1430, cnt: 2))
    }
}

extension OrderViewController: ExpyTableViewDelegate, ExpyTableViewDataSource {
    
    
    //섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    //row 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return dummyOrderItemes.count + 1
        } else if section == 1 {
            return 2
        } else {
            return 1
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
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetFirstCell") as? OrderSheetFirstCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            if statusCell[0] {
                cell.itemName.isHidden = true
                cell.itemCnt.isHidden = true
                cell.arrowImg.image = UIImage(named: "TopArrow")
                
            }else {
                cell.itemName.isHidden = false
                cell.itemCnt.isHidden = false
                cell.arrowImg.image = UIImage(named: "bottomArrow")
            }
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetSecondCell") as? OrderSheetSecondCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            if statusCell[1] {
                cell.userInfoLabel.isHidden = true
                cell.arrowImg.image = UIImage(named: "TopArrow")
                
            }else {
                cell.userInfoLabel.isHidden = false
                cell.arrowImg.image = UIImage(named: "bottomArrow")
            }
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetThirdCell") as? OrderSheetThirdCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 3 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "onlyBannerCell") as? OnlyBannerCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 4 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetFifthCell") as? OrderSheetFifthCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 5 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetSixCell") as? OrderSheetSixCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 6 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetSevenCell") as? OrderSheetSevenCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 7 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetLastCell") as? OrderSheetLastCell else {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemFirstCell", for: indexPath) as? OrderItemFirstCell else {
                return UITableViewCell()
            }
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderUserInfoSecondCell", for: indexPath) as? OrderUserInfoSecondCell else {
                return UITableViewCell()
            }
            return cell
        default :
            return UITableViewCell()
        }
    
    }
    
    // 선택후 동작하는 거 여기서 하기!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)섹션 \(indexPath.row)로우 선택됨")
        statusCell[indexPath.section] = !statusCell[indexPath.section]
        tableView.reloadData()
    }
    
    // cell 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            // 섹션 높이는 60 , 하위 Cell 높이는 100 으로 설정
            if indexPath.row == 0 {
                return 60
            }else {
                return 100
            }
        case 1 :
            if indexPath.row == 0 {
                return 60
            }else {
                return 160
            }
        case 2 :
            return UITableView.automaticDimension
        case 3 :
             return 80
        case 4,5 :
            return 220
        case 6 :
            return 330
        case 7 :
            return 430
        default :
            return 0
        }

        
    }
}

// MARK: - Cells

// 주문상품
class OrderSheetFirstCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCnt: UILabel!
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
}

class OrderItemFirstCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemOrignPrice: UILabel!
    @IBOutlet weak var itemCnt: UILabel!
    
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

// 주문자 정보
class OrderSheetSecondCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var arrowImg: UIImageView!
    @IBOutlet weak var userInfoLabel: UILabel!
    
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

class OrderUserInfoSecondCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
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
    
    @IBAction func inputAddress_blank(_ sender: Any) {
    }
    
    @IBAction func modifyAddress_full(_ sender: Any) {
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

// 배너는 이미 있으니 넘어가


// 쿠폰 적립금
class OrderSheetFifthCell: UITableViewCell {
    
    // MARK: - Components
    
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
// 결제 수단

class OrderSheetSixCell: UITableViewCell {
    
    // MARK: - Components
    
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


// 결제 진행 필수 동의

class OrderSheetLastCell: UITableViewCell {
    
    // MARK: - Components
    
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


/*
 
 
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }
 
 */
