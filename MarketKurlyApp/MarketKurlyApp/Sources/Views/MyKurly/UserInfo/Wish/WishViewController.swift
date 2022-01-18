//
//  WishViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit

class WishViewController: UIViewController {
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
        customNaviBarItem(btnColor: .black, naviItem: self.navigationItem)
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension WishViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "wishCell", for: indexPath) as? WishCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

class WishCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var cartAddBtn: UIButton!
    
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
        deleteBtn.layer.borderWidth = 1
        deleteBtn.layer.borderColor = UIColor.lineColor.cgColor
        deleteBtn.layer.cornerRadius = 5
        cartAddBtn.layer.borderWidth = 1
        cartAddBtn.layer.borderColor = UIColor.mainKurlyPurple.cgColor
        cartAddBtn.layer.cornerRadius = 5
    }
}
