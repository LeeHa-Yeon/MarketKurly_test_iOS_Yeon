//
//  EventViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/18.
//

import UIKit

protocol EventCRVDelegate {
    func presnetAlert(message: String)
}

extension EventViewController: EventCRVDelegate {
    func presnetAlert(message: String) {
        let alert = UIAlertController(title: "쿠폰 발급", message: "이벤트에 \(message)", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
        }
        alert.addAction(defaultAction)
        self.present(alert, animated: false, completion: nil)
    }
    
    
}

class EventViewController: UIViewController {
    
    var eventId: Int?
    var evnetTitle: String = "농활갑시다 이벤트"
    var couponInfo: SelectCouponInfoDocument?
    
    let couponeManager = CouponDataManager.shared
    
    // MARK: - Components
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    // MARK: - Functions
    func setUI(){
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "EventCRVCell", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "eventCRVCell")
        registerNib(cellNibName: "Product2Cell", cellIdentifier: "product2Cell")
    
        naviTitleDelete(navi: self.navigationController!)
        customNavigationBarAttribute(.white, .black)
        customNaviBarItem(btnColor: .black, naviItem: self.navigationItem)
        self.title = "\(evnetTitle)"
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.collectionView.register(newCellNib, forCellWithReuseIdentifier: cellIdentifier)
    }
    

    
}

extension EventViewController : UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "eventCRVCell", for: indexPath) as? EventCRVCell else {
            return UICollectionReusableView()
        }
        if couponInfo != nil {
            headerView.eventName.text = "[이벤트] \(couponInfo?.couponName ?? "할인쿠폰")"
            headerView.eventSubName.text = "추가 \(DecimalWon(value: Int(couponInfo!.discount))) 할인 쿠폰"
            headerView.discountLabel.text =  "\(DecimalWon(value: Int(couponInfo!.discount)))"
            headerView.couponName.text = " \(couponInfo?.couponName ?? "할인쿠폰")"
    
            headerView.dateLabel.text = getFormattedDate2(dateString: couponInfo!.expired_date)
            
        }
        headerView.delegate = self
        headerView.eventId = eventId!
        
        headerView.action = { (state: ButtomClickSort) in
                switch state {
                case .recommendOrder :
                    print("추천순")
                case .newProductOrder :
                    print("신상품순")
                case .doneOrder :
                    print("판매량순")
                case .salesOrder :
                    print("혜택순")
                case .lowPriceOrder :
                    print("낮은가격순")
                case .highPriceOrder :
                    print("높은가격순")
                }
                self.collectionView.reloadData()
            }
    
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product2Cell", for: indexPath) as? Product2Cell else {
            return UICollectionViewCell()
        }
        return cell
    }

    //컬렉션뷰 사이즈 설정
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 465)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin:CGFloat = 25
        let cellRatio: CGFloat = 5/3
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth =  (screenWidth-margin) / CGFloat(2)
        let cellHeight = cellWidth * cellRatio + 50
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
