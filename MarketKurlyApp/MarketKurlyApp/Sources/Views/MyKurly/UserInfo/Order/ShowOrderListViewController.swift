//
//  ShowOrderListViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit
import ExpyTableView
import SafariServices


class ShowOrderListViewController: UIViewController {
    
    let userInfoManager = UserInfoManaer.shared
    let addressDataManager = AddressDataManager.shared
    
    var statusCell = [true,true,true,true,true,true,true]
    var orderItemes: [ShowCartListDocument] = []
    var myOrderDetailContent: MyOrderDetailDocument?
    
    var dummyListName = ["주문번호 16543534523","","결제정보","주문정보","배송정보","추가정보"]
    let dummyStatus = ["냉장","상온"]

    // MARK: - Components
    @IBOutlet weak var tableView: ExpyTableView!
    
    @IBAction func moveToURL(_ sender: Any) {
        moveToWeb(url: "https://www.freshsolutions.co.kr/main/delivery_check.php?invoice_no=220-H0-1612874912972-0001" )
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setUI()
        print("--->",myOrderDetailContent)
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
    
    func moveToWeb(url: String){
        let targetUrl = NSURL(string: url)
        let targetSafariView: SFSafariViewController = SFSafariViewController(url: targetUrl as! URL)
        self.present(targetSafariView, animated: true, completion: nil)
    }
    
    /* API 통신할 부분 */
    func setData(){
        guard let myOrderDetailContent = myOrderDetailContent else {
            return
        }
        orderItemes = myOrderDetailContent.items
        dummyListName[0] = "주문번호 \(myOrderDetailContent.orderId)"
        
        
    }
    
}


extension ShowOrderListViewController: ExpyTableViewDelegate, ExpyTableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return orderItemes.count + 2
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
            if indexPath.row == orderItemes.count + 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "allReCartCell", for: indexPath) as? AllReCartCell else {
                    return UITableViewCell()
                }
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemFirstCell", for: indexPath) as? OrderItemFirstCell else {
                    return UITableViewCell()
                }
                cell.isOrder = true
                
                let target = orderItemes[indexPath.row-1]
                
                urlToImg(urlStr: target.getItemRes.items_img_url, img: cell.itemImg)
                cell.itemName.text =  target.getItemRes.name
                
                if target.getItemRes.discount_rate == "0%" {
                    cell.itemOrignPrice.isHidden = true
                    cell.itemPrice.text = DecimalWon(value: target.getItemRes.price)
                    
                }else {
                    cell.itemOrignPrice.isHidden = false
                    cell.itemPrice.text = DecimalWon(value: target.getItemRes.member_discount_price)
                    cancleLine(text: DecimalWon(value: target.getItemRes.price), targetLabel: cell.itemOrignPrice)
                }
                cell.itemCnt.text = "\(target.count)개"
                
                
                if cell.isOrder {
                    cell.itemDoneStatus.isHidden = false
                }
                return cell
            }
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "payInfoCell", for: indexPath) as? PayInfoCell else {
                return UITableViewCell()
            }
            cell.itemPrice.text = DecimalWon(value: myOrderDetailContent?.payDetail.itemPrice ?? 0)
            cell.deliveryPrice.text = DecimalWon(value: myOrderDetailContent?.payDetail.deliverPrice ?? 0)
            cell.usePointPrice.text = DecimalWon(value: myOrderDetailContent?.payDetail.usePoint ?? 0)
            cell.payPrice.text = DecimalWon(value: myOrderDetailContent?.payDetail.payPrice ?? 0)
            cell.accumulatePoint.text = DecimalWon(value: myOrderDetailContent?.payDetail.accumulatePoint ?? 0)
            
            return cell
        case 3 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderInfoCell", for: indexPath) as? OrderInfoCell else {
                return UITableViewCell()
            }
            let payDate = myOrderDetailContent?.createdAt
            let targetDate = payDate!.substring(from: 0, to: 10)
            let targetTime = payDate!.substring(from: 11, to: 19)
            
            cell.orderIdx.text = "\(myOrderDetailContent?.orderId ?? 0)"
            cell.orderName.text = "\(userInfoManager.getUserName())"
            cell.postName.text = "\(userInfoManager.getUserName())"
            cell.payDate.text = "\(targetDate) \(targetTime)"
            return cell
        case 4 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "deliveryCell", for: indexPath) as? DeliveryCell else {
                return UITableViewCell()
            }
            
            cell.receiveName.text = "\(myOrderDetailContent?.deliverAddress.name ?? "")"
            cell.receivePhone.text = "\(myOrderDetailContent?.deliverAddress.phoneNumber ?? "")"
            cell.receiveAddress.text = "\(myOrderDetailContent?.deliverAddress.address ?? "") \(myOrderDetailContent?.deliverAddress.detail_address ?? "")"
            cell.receiveSpace.text = "문 앞"
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
