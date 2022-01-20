//
//  SpecialPriceViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit
import XLPagerTabStrip

class SpecialPriceViewController: UIViewController, IndicatorInfoProvider {

    var tabName: String = ""
    let eventDataManger = EventDataManager.shared
    let couponDataManager = CouponDataManager.shared
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
    
    func moveToVC(eventIdx: Int, couponIdx: Int) {
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        guard let EventVC = storyboard.instantiateViewController(identifier: "EventSB") as? EventViewController else { return }
        EventVC.eventId = eventIdx
        
        /* API 통신 부분 */
        couponDataManager.requestSelectCouponInfo(couponId: couponIdx) { response in
            EventVC.couponInfo = response.result
            self.navigationController?.pushViewController(EventVC, animated: true)
        }
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

        cell.eventBannerImg.image = UIImage(named: "event\(indexPath.row+1)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var couponId: Int = 9
        switch indexPath.row {
        case 0 :
            couponId = 1
        case 1:
            couponId = 2
        case 2:
            couponId = 3
        case 3:
            couponId = 4
        case 4:
            couponId = 5
        case 5:
            couponId = 11
        case 6:
            couponId = 12
        default :
            assert(false)
            
        }
        moveToVC(eventIdx: indexPath.row+1,couponIdx: couponId)

    }
    
}
