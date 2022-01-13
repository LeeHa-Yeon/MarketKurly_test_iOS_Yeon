//
//  CategoryViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class CategoryViewController: UIViewController {
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    func setUI(){
        self.bgKurlyColor(self.navigationController!, self.navigationItem, title: "카테고리")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return " "
    }
    
    // 섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryGiftCell", for: indexPath) as? CategoryGiftCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryListCell", for: indexPath) as? CategoryListCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryRecommendCell", for: indexPath) as? CategoryRecommendCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 50
        case 1 :
            return 1100
        default :
            return 1500
        }
    }
    
    
}
