//
//  AddressManagmentViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit

class AddressManagmentViewController: UIViewController {
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func testMoveTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Order", bundle: nil)
        guard let AfterOrderVC = storyboard.instantiateViewController(identifier: "AfterOrderSB") as? AfterOrderViewController else {
            return }
        self.present(AfterOrderVC, animated: true, completion: nil)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Functions
    func setUI(){
        customNavigationBarAttribute(.white, .black)
        naviTitleDelete(navi: self.navigationController!)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension AddressManagmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "addressListCell", for: indexPath) as? AddressListCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}



class AddressListCell: UITableViewCell {
    
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
