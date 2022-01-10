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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
        cell.eventBanner.imageView?.image = UIImage(named: "banner")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}


class EventCell: UITableViewCell {
    @IBOutlet weak var eventBanner: UIButton!
    
    @IBAction func bannerTapped(_ sender: Any) {
        print("탭했어요~~~")
    }
    // MARK: - 생명주기
    override func awakeFromNib() {
        super.awakeFromNib()
        eventBanner.imageView?.contentMode = .scaleToFill
        eventBanner.clipsToBounds = true
    }
}
