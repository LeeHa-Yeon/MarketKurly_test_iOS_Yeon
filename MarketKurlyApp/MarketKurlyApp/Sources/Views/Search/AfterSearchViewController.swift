//
//  AfterSearchViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/11.
//

import UIKit

class AfterSearchViewController: UIViewController {
    
    let dummyData = ["[오뚜기1]","[오뚜기2]","[오뚜기3]","[오뚜기4]","[오뚜기5]","[오뚜기6]","[오뚜기] 이하연","[오뚜기] 이하연","[오뚜기] 이하연","[오뚜기] 이하연"]
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension AfterSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath) as? SearchResultCell else {
            return UITableViewCell()
        }
        cell.resultLabel.text = dummyData[indexPath.row]
        return cell
    }
    
    
}

class SearchResultCell: UITableViewCell {
    @IBOutlet weak var resultLabel: UILabel!
}
