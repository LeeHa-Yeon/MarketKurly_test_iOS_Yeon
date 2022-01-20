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
    var itemDocument: ItemContentDocument?
    let userInfoManater = UserInfoManaer.shared
    
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
        
        let itemInfo = itemDocument
        
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemMainCell", for: indexPath) as? ItemMainCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.delegate = self

            if itemInfo != nil {
                // 공통
                urlToImg(urlStr: itemInfo!.items_img_url, targetImg: cell.itemImg)
                cell.itemNameLabel.text = itemInfo?.name
                cell.itemSubNameLabel.text = itemInfo?.product_description
                
                let levelInfo = userInfoManater.getUserLevelInfo()
                cell.userLevelLabel.text = "\(levelInfo?.name) \(levelInfo!.pointsRate)%"
                
                let point = Double(levelInfo!.pointsRate) * 0.1 * Double(itemInfo!.price)
                
                let pointUp = round(point*pow(10,0))/pow(10,0)
                cell.pointLabel.text = "개당 \(pointUp)원 적립"
                
                // 할인 유무
                if itemInfo?.discount_rate == "0%" {
                    cell.memberDiscount.isHidden = true
                    cell.itemDiscountRate.isHidden = true
                    cell.itemOriginPriceLabel.isHidden = true
                    cell.itemSalePriceLabel.text = DecimalWon2(value: itemInfo?.price ?? 12900)
                } else {
                    cell.memberDiscount.isHidden = false
                    cell.itemDiscountRate.isHidden = false
                    cell.itemOriginPriceLabel.isHidden = false
                    cell.itemSalePriceLabel.text = DecimalWon2(value: itemInfo?.member_discount_price ?? 15900)
                    cell.itemDiscountRate.text = itemInfo?.discount_rate
                    cancleLine(text: DecimalWon(value: itemInfo?.price ?? 20900), targetLabel: cell.itemOriginPriceLabel)
                }
                
                // 쿠폰 유무
                if itemInfo?.coupon == 0 {
                    cell.tempView.isHidden = true
                    cell.couponButton.isHidden = true
                } else {
                    cell.couponButton.isHidden = false
                }
            }
            
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemInfoCell", for: indexPath) as? ItemInfoCell else {
                return UITableViewCell()
            }
            cell.salesUnit.text = itemInfo?.sales_unit
            cell.weightCapacity.text = itemInfo?.weight_capacity
            cell.shippingCategory.text = itemInfo?.shipping_category
            cell.origin.text = itemInfo?.origin
            cell.packagingType.text = itemInfo?.packaging_type
            cell.shelf_life.text = itemInfo?.shelf_life
            cell.notification.text = itemInfo?.notification
            
            cell.selectionStyle = .none
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemImgUrlCell", for: indexPath) as? ItemImgUrlCell else {
                return UITableViewCell()
            }
            urlToImg(urlStr: itemInfo!.item_details_img_url, img: cell.imageDetailImgView)
            cell.selectionStyle = .none
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ItemExplanationViewController: ShareViewControllerDelegate {
    func moveToVC() {
        print("아이템부분 동작하니?")
        let ShareVC = UIStoryboard.init(name: "Item", bundle: nil).instantiateViewController(withIdentifier: "ShareSB") as! ShareViewController
        self.present(ShareVC, animated: true, completion: nil)
    }
    
    
}
