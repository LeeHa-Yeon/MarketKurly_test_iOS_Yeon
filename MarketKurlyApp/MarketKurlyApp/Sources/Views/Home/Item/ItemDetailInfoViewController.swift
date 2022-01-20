//
//  ItemDetailInfoViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit
import XLPagerTabStrip


class ItemDetailInfoViewController: UIViewController,IndicatorInfoProvider {

    var tabName: String = ""
    var itemDocument: ItemContentDocument?
    
    // MARK: - Components
    
    @IBOutlet weak var itemDetailInfo: UIImageView!
    
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
        urlToImg(urlStr: itemDocument!.more_informaion_url, img: itemDetailInfo)
    }
    
}

