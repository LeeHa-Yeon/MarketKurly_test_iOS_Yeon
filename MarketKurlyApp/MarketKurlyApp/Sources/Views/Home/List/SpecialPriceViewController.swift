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
    let eventDataManger = EventDataManager.shared
    var eventList: [EventDocument] = []
    
    // MARK: - UIComponents
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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
    
    /* API 통신 부분  */
    func loadData(){
        eventDataManger.requestEventList { response in
            self.eventList = response.result
            self.tableView.reloadData()
        }
    }

}

extension SpecialPriceViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count - 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventCell else {
            return UITableViewCell()
        }
        print("d???-> event\(indexPath.row+1)")
        cell.delegate = self
        cell.eventId = indexPath.row
        cell.eventBanner.imageView?.image = UIImage(named: "event\(indexPath.row+1)")
        cell.eventBannerImg.image = UIImage(named: "event\(indexPath.row+1)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
