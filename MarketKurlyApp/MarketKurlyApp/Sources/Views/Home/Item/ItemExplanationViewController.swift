//
//  ItemExplanationViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit
import XLPagerTabStrip

protocol ShareViewControllerDelegate {
    func moveToVC()
}


class ItemExplanationViewController: UIViewController, IndicatorInfoProvider {
    
    var tabName: String = ""
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(tabName)")
    }
    
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        registerNib(cellNibName: "ItemMainCell", cellIdentifier: "itemMainCell")
        registerNib(cellNibName: "ItemInfoCell", cellIdentifier: "itemInfoCell")
        registerNib(cellNibName: "ItemImgUrlCell", cellIdentifier: "itemImgUrlCell")
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.tableView.register(newCellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
}

extension ItemExplanationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemMainCell", for: indexPath) as? ItemMainCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemInfoCell", for: indexPath) as? ItemInfoCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemImgUrlCell", for: indexPath) as? ItemImgUrlCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
}

extension ItemExplanationViewController: ShareViewControllerDelegate {
    func moveToVC() {
        print("아이템부분 동작하니?")
        let ShareVC = UIStoryboard.init(name: "Item", bundle: nil).instantiateViewController(withIdentifier: "ShareSB") as! ShareViewController
        self.present(ShareVC, animated: true, completion: nil)
    }
    
    
}
