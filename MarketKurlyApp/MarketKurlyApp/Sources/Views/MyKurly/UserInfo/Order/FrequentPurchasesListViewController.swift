//
//  FrequentPurchasesListViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit


class FrequentPurchasesListViewController: UIViewController {
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "주문내역"
        setUI()
        super.viewWillAppear(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension FrequentPurchasesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "frequentItemListCell", for: indexPath) as? FrequentItemListCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /* API 통신해야되는 부분 */
        // 아이템의 아이디를 찾아 넘겨주어서 나타내기
        
        let storyboard = UIStoryboard(name: "Item", bundle: nil)
        let ItemDetailVC = storyboard.instantiateViewController(identifier: "ItemDetailSB")
        self.navigationController?.pushViewController(ItemDetailVC, animated: true)
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}

class FrequentItemListCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var orderNumView: UIView!
    
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
