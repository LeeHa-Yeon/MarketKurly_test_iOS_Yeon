//
//  SearchSubject4Cell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/12.
//

import UIKit


class SearchSubject4Cell: UITableViewCell {
    let dummySearchWord = ["폭립","게장","미주라","다담","대패","무설탕","무쌈","휘낭시에","서울우유","대패삼겹살"]
    
    // MARK: - Components
    @IBOutlet weak var searchTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
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
        tableView.dataSource = self
        tableView.delegate = self
        registerNib(cellNibName: "VogueSearchWorldCell", cellIdentifier: "vogueSearchWorldCell")
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.tableView.register(newCellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
}

extension SearchSubject4Cell : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummySearchWord.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "vogueSearchWorldCell", for: indexPath) as? VogueSearchWorldCell else {
            return UITableViewCell()
        }
        cell.rankNumLabel.text = "\(indexPath.row + 1)"
        cell.searchWord.text = dummySearchWord[indexPath.row]
        return cell
    }
    
    
}
