//
//  NotionListViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit

class NotionListViewController: UIViewController {
    
    let etcDataManager = NotionDataManager.shared
    var datasoureList: [NotionDocument] = []
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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
        tableView.delegate = self
        tableView.dataSource = self
        
        naviTitleDelete(navi: self.navigationController!)
        customNavigationBarAttribute(.white, .black)
    }
    
    /* API 통신하는 부분 */
    func loadData(){
        etcDataManager.requestShowNotion { response in
            self.datasoureList = response.result
            self.tableView.reloadData()
        }
    }
}


extension NotionListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasoureList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "notionListCell", for: indexPath) as? NotionListCell else {
            return UITableViewCell()
        }
        let target = datasoureList[indexPath.row]
        cell.notionTitle.text = target.title
        cell.notionDate.text = target.time
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}



class NotionListCell: UITableViewCell {
    
    // MARK: - Components
    
    @IBOutlet weak var notionTitle: UILabel!
    @IBOutlet weak var notionDate: UILabel!
    
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
