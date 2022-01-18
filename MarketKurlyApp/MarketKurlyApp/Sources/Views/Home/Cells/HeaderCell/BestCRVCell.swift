//
//  BestCRVCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit
import DropDown

class BestCRVCell: UICollectionReusableView {

    let dropDown = DropDown()
    var action = { (state: ButtomClickSort) in }
    
    // MARK: - Components
    @IBOutlet weak var arraowImg: UIImageView!
    @IBOutlet weak var sortBtn: UIButton!
    @IBAction func sortBtnTapped(_ sender: Any) {
        dropDown.anchorView = sortBtn
        dropDown.show()
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
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
            print("선택한 아이템 : \(item)")
            print("인덱스 : \(index)")
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
    }
    
    func test(){
        print("test")
    }
    
}
