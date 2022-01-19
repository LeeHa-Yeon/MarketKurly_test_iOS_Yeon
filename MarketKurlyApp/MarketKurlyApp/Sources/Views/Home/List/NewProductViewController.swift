//
//  NewProductViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit
import XLPagerTabStrip
import Kingfisher


class NewProductViewController: UIViewController, IndicatorInfoProvider {
    
    var tabName: String = ""
    var itemList: [SortDocument] = []
    let itemManager = ItemListDataManager.shared
    
    // MARK: - UIComponents
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
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
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "NewProductCRVCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "newProductCRVCell")
        registerNib(cellNibName: "Product2Cell", cellIdentifier: "product2Cell")
        
        
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.collectionView.register(newCellNib, forCellWithReuseIdentifier: cellIdentifier)
    }

    
    /* API 부분 */
    func setData(){
        self.itemManager.requestNewItemSortList { response in
            self.itemList = response.result
            self.collectionView.reloadData()
        }
    }
}

extension NewProductViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "newProductCRVCell", for: indexPath) as? NewProductCRVCell else {
            return UICollectionReusableView()
        }
        headerView.action = { (state: ButtomClickSort) in
            switch state {
            case .recommendOrder :
                self.itemManager.requestOrderItemSortList { response in
                    self.itemList = response.result
                    self.collectionView.reloadData()
                }
            case .newProductOrder :
                
                self.itemManager.requestNewItemSortList { response in
                    self.itemList = response.result
                    self.collectionView.reloadData()
                }
            case .doneOrder :
                self.itemManager.requestOrderItemSortList { response in
                    self.itemList = response.result
                    self.collectionView.reloadData()
                }
            case .salesOrder :
                self.itemManager.requestSaleItemSortList { response in
                    self.itemList = response.result
                    self.collectionView.reloadData()
                }
            case .lowPriceOrder :
                self.itemManager.requestLowPriceItemSortList  { response in
                    self.itemList = response.result
                    self.collectionView.reloadData()
                }
            case .highPriceOrder :
                self.itemManager.requestHighPriceItemSortList { response in
                    self.itemList = response.result
                    self.collectionView.reloadData()
                }
            }
        }
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product2Cell", for: indexPath) as? Product2Cell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        let target = itemList[indexPath.row]
        //////////////////////////////////////////////////// 공통  ////////////////////////////////////////////////
        // 아이템 아이디 넘겨주기
        cell.itemId = target.itemId
        
        // 설날특가 없애기 ( 우선 )
        cell.newYearImg.isHidden = true
        
        // 아이템 이미지
        urlToImg(urlStr: target.items_img_url , targetImg: cell.itemImg )
        cell.itemTitle.text = target.name
        
        
        //////////////////////////////////////////////////// 따로  ////////////////////////////////////////////////
        // 할인 여부
        if target.discount_rate != "0%" {
            cell.discountLabel.isHidden = false
            cell.originPrice.isHidden = false
            cell.discountLabel.text = target.discount_rate
            cancleLine(text: DecimalWon(value: target.price), targetLabel: cell.originPrice)
            cell.salePrice.text = DecimalWon(value: target.member_discount_price)
        }else {
            cell.discountLabel.isHidden = true
            cell.originPrice.isHidden = true
            cell.salePrice.text = DecimalWon(value: target.price)
        }
        
        // 선물 여부
        if target.present == 0 {
            cell.giftImg.isHidden = true
        } else {
            cell.giftImg.isHidden = false
        }
        
        // 쿠폰 여부
        if target.coupon == 0 {
            cell.couponImg.isHidden = true
        } else {
            cell.couponImg.isHidden = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("체크",itemList[indexPath.row].itemId,itemList[indexPath.row].name)
    }
    
    //컬렉션뷰 사이즈 설정
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin:CGFloat = 35
        let cellRatio: CGFloat = 5/3
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth =  (screenWidth-margin) / CGFloat(2)
        let cellHeight = cellWidth * cellRatio + 50
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
}

extension NewProductViewController: ItemBuyViewControllerDelegate {
    func moveToVC() {
        let storyboard = UIStoryboard(name: "Item", bundle: nil)
        let ItemDetailVC = storyboard.instantiateViewController(identifier: "ItemBuySB")
        present(ItemDetailVC, animated: true, completion: nil)
    }
    
    func updateData(){
        self.collectionView.reloadData()
    }
}
