//
//  SpecialPriceViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit
import XLPagerTabStrip

protocol EventViewControllerDelegate {
    func moveToVC(id: Int)
}


class SpecialPriceViewController: UIViewController, IndicatorInfoProvider {

    var tabName: String = ""
    
    // MARK: - UIComponents
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
    }

}

extension SpecialPriceViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.eventId = indexPath.row
        cell.eventBanner.imageView?.image = UIImage(named: "banner")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}

extension SpecialPriceViewController: EventViewControllerDelegate {
    func moveToVC(id: Int) {
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        guard let EventVC = storyboard.instantiateViewController(identifier: "EventSB") as? EventViewController else { return }
        EventVC.eventId = id
        self.navigationController?.pushViewController(EventVC, animated: true)
    }
}
