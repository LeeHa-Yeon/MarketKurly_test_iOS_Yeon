//
//  OrderDetailListViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//


import UIKit

class OrderDetailListViewController: UIViewController {
    let userInfoManager = UserInfoManaer.shared
    let orderDataManager = OrderDataManager.shared
    
    var myOrderList: [MyOrderListDocumnet] = []
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    /* API 통신 */
    func setData(){
        orderDataManager.requestMyOrderList(userId: userInfoManager.getUid()) { response in
            if response.isSuccess {
                self.myOrderList = response.result
                self.tableView.reloadData()
            }
        }
    }
    
}

extension OrderDetailListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myOrderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderDetailListCell", for: indexPath) as? OrderDetailListCell else {
            return UITableViewCell()
        }
        
        let target = myOrderList[indexPath.row]
        let targetDate = target.createdAt.substring(from: 0, to: 10)
        let targetTime = target.createdAt.substring(from: 11, to: 19)
        
        cell.orderIdLabel.text = "\(target.orderId)"
        cell.itemNameLabel.text = target.firstItem
        cell.payDateLabel.text = "\(targetDate) \(targetTime)"
        cell.payStyleLabel.text = target.paymentType
        cell.payPriceLabel.text = DecimalWon(value: target.price)
        cell.orderStatusLabel.text = target.status
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let target = myOrderList[indexPath.row]
        orderDataManager.requestMyOrderDetail(userId: userInfoManager.getUid(), orderId: target.orderId) { response in
            if response.isSuccess {
//                response.result
            }
            print(response.result)
        }
        
        
        
        
//        let storyboard = UIStoryboard(name: "Order", bundle: nil)
//        guard let ShowOrderListVC = storyboard.instantiateViewController(identifier: "ShowOrderListSB") as? ShowOrderListViewController else { return }
//        self.navigationController?.pushViewController(ShowOrderListVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

class OrderDetailListCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var orderNumView: UIView!
    
    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var payDateLabel: UILabel!
    @IBOutlet weak var payStyleLabel: UILabel!
    @IBOutlet weak var payPriceLabel: UILabel!
    @IBOutlet weak var orderStatusLabel: UILabel!
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    
    // MARK: - Functions
    func setUI(){
        orderNumView.layer.addBorder([ .bottom], color: UIColor.lineColor, width: 1.0)
    }
    
}
