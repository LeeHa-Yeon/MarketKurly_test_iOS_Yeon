//
//  EventCRVCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit
import DropDown

class EventCRVCell: UICollectionReusableView {
    
    var delegate: EventCRVDelegate?
    
    let couponDataManger = CouponDataManager.shared
    let userInfoManager = UserInfoManaer.shared
    
    var itemList: [SortDocument] = []
    let itemManager = ItemListDataManager.shared
    var eventId: Int = 13
    var delegate2: ItemBuyViewControllerDelegate?

    @IBAction func downloadImg(_ sender: Any) {
        downloadCoupon()
    }
    let dropDown = DropDown()
    var action = { (state: ButtomClickSort) in }
    
    // MARK: - Components
    @IBOutlet weak var arraowImg: UIImageView!
    @IBOutlet weak var sortBtn: UIButton!
    @IBAction func sortBtnTapped(_ sender: Any) {
        dropDown.anchorView = sortBtn
        dropDown.show()
        dropDown.bottomOffset = CGPoint(x: -30, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            sortBtn.setTitle(item, for: .normal)
            
            switch index {
            case 0 :
                action(.recommendOrder)
            case 1 :
                action(.newProductOrder)
            case 2 :
                action(.doneOrder)
            case 3 :
                action(.salesOrder)
            case 4 :
                action(.lowPriceOrder)
            case 5 :
                action(.highPriceOrder)
            default :
                assert(false,"아님")
            }
            self.dropDown.clearSelection()
        }
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        setUI()
        super.awakeFromNib()
    }
    
    // MARK: - Functions
    func setUI(){
        dropDown.dataSource = ["추천순", "신상품순", "판매량순", "혜택순", "낮은 가격순", "높은 가격순"]
        dropDown.selectedTextColor = UIColor.mainKurlyPurple
        dropDown.textFont = UIFont.systemFont(ofSize: 14)
        dropDown.width = 100
        dropDown.backgroundColor = UIColor.white
        dropDown.selectionBackgroundColor = UIColor.white
        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
                    cell.optionLabel.textAlignment = .right
                }
    }
    
    
    /* API 통신 부분 */
    func setData(itemSort: Int) -> [SortDocument] {
        switch itemSort {
        case 0 :
            self.itemManager.requestNewItemSortList { response in
                self.itemList = response.result
            }
        case 1 :
            self.itemManager.requestOrderItemSortList { response in
                self.itemList = response.result
            }
        case 2 :
            self.itemManager.requestSaleItemSortList { response in
                self.itemList = response.result
            }
        case 3 :
            self.itemManager.requestLowPriceItemSortList  { response in
                self.itemList = response.result
            }
        case 4 :
            self.itemManager.requestHighPriceItemSortList { response in
                self.itemList = response.result
            }
            
        default :
            assert(false,"선택안함")
        }
        return self.itemList
    }
    
    /* API 통신 부분 */
    func downloadCoupon(){
        couponDataManger.requestDownloadCoupon(token: userInfoManager.tokenString!, eventId: eventId) { response in
            print("흠\(self.eventId)")
            self.couponDataManger.requestUserCouponList(token: self.userInfoManager.tokenString!) { response in
                self.userInfoManager.setUserCouponInfo(response.result!)
            }
            self.delegate?.presnetAlert(message: response.result)
            
        }
    }
    
}
