//
//  OrderViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit
import ExpyTableView


protocol testDelegate  {
    func moveToVC()
}
extension OrderViewController  : testDelegate {
    func moveToVC(){
        let storyboard = UIStoryboard(name: "Order", bundle: nil)
        guard let AfterOrderVC = storyboard.instantiateViewController(identifier: "AfterOrderSB") as? AfterOrderViewController else { return }
        AfterOrderVC.name = userInfoManager.getUserName()
        AfterOrderVC.totalPrice = totalSalePrice
        
        let para: OrderRequest = OrderRequest(paymentId: payIdx, deliverAddressId: selectAddress!.id, basketIds: basketIds, price: totalSalePrice, points: nil, couponIdList: nil)
        orderDataManager.requestOrder(userId: userInfoManager.getUid(), para: para) { response in
            print("=====>",response)
            if response.isSuccess {
                self.present(AfterOrderVC, animated: true, completion: nil)
            }
        }
    }
}

class OrderViewController: UIViewController {
    
    var statusCell = [false,false,false,false,false,false,false,false]
    
    let userInfoManager = UserInfoManaer.shared
    let addressDataManager = AddressDataManager.shared
    let orderDataManager = OrderDataManager.shared
    var basketIds: [Int] = []
    var myCartList: [ShowCartListDocument] = []
    var selectAddress: CurrentSelectAddressDocument?
    
    var salePrice: Int = 0
    var originPrice: Int = 0
    var discountPrice: Int = 0
    var deliveryPrice: Int = 0
    var couponDiscountPrice: Int = 0
    var pointDiscountPrice:Int = 0
    
    var totalSalePrice: Int = 0
    
    var selectCnt: Int = 0
    var payIdx:Int = 2
    
    // MARK: - Components
    @IBOutlet weak var tableView: ExpyTableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        setData()
        setUI()
    }
    
    
    // MARK: - Functions
    func setUI(){
        self.title = "주문서"
        tableView.dataSource = self
        tableView.delegate = self
        customNavigationBarAttribute(.white, .black)
        naviTitleDelete(navi: self.navigationController!)
        setNib()
    }
    
    func setNib(){
        registerNib(cellNibName: "OrderSheetFirstCell", cellIdentifier: "orderSheetFirstCell")
        registerNib(cellNibName: "OrderItemFirstCell", cellIdentifier: "orderItemFirstCell")
        registerNib(cellNibName: "OrderSheetSecondCell", cellIdentifier: "orderSheetSecondCell")
        registerNib(cellNibName: "OrderUserInfoSecondCell", cellIdentifier: "orderUserInfoSecondCell")
        registerNib(cellNibName: "OrderSheetThirdCell", cellIdentifier: "orderSheetThirdCell")
        registerNib(cellNibName: "OnlyBannerCell", cellIdentifier: "onlyBannerCell")
        registerNib(cellNibName: "OrderSheetFifthCell", cellIdentifier: "orderSheetFifthCell")
        registerNib(cellNibName: "OrderSheetSixCell", cellIdentifier: "orderSheetSixCell")
        registerNib(cellNibName: "OrderSheetSevenCell", cellIdentifier: "orderSheetSevenCell")
        registerNib(cellNibName: "OrderSheetLastCell", cellIdentifier: "orderSheetLastCell")
    }
    
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.tableView.register(newCellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func pointTransform(totalPrice: Int, pointLabel: UILabel){
        let levelInfo = userInfoManager.getUserLevelInfo()
        
        guard let levelInfo = levelInfo else {
            pointLabel.text = "로그인 후, 적립해택 제공"
            return
        }
        
        let point = levelInfo.pointsRate * 0.1 * Double(totalPrice)
        let pointUp = round(point*pow(10,0))/pow(10,0)
        pointLabel.text = "구매시 \(Int(pointUp))원(\(levelInfo.pointsRate)%)"
    }
    
    
    
    /* API 통신할 부분 */
    func setData(){
        addressDataManager.requestCurrentSelectAddress(userId: userInfoManager.getUid()) { response in
            self.selectAddress = response.result
            self.tableView.reloadData()
        }
        
    }
}

extension OrderViewController: ExpyTableViewDelegate, ExpyTableViewDataSource {
    
    
    //섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    //row 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return selectCnt+1
        } else if section == 1 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        print("\(section)섹션")
        
    }
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    // 섹션 내용을 작성하는 부분
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        switch section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetFirstCell") as? OrderSheetFirstCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            if statusCell[0] {
                cell.itemName.isHidden = true
                cell.itemCnt.isHidden = true
                cell.arrowImg.image = UIImage(named: "TopArrow")
                
            }else {
                cell.itemName.isHidden = false
                
                cell.arrowImg.image = UIImage(named: "bottomArrow")
                cell.itemName.text = myCartList[0].getItemRes.name
                if selectCnt > 1 {
                    // 2개 이상
                    cell.itemCnt.isHidden = false
                    cell.itemCnt.text = "외 \(selectCnt-1)건"
                }else {
                    cell.itemCnt.isHidden = true
                }
                
                
            }
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetSecondCell") as? OrderSheetSecondCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            if statusCell[1] {
                cell.userInfoLabel.isHidden = true
                cell.arrowImg.image = UIImage(named: "TopArrow")
                
            }else {
                cell.userInfoLabel.isHidden = false
                cell.arrowImg.image = UIImage(named: "bottomArrow")
                
                cell.userInfoLabel.text = "\(userInfoManager.userInfo?.name ?? ""),\(userInfoManager.userInfo?.phoneNumber ?? "")"
            }
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetThirdCell") as? OrderSheetThirdCell else {
                return UITableViewCell()
            }
            if selectAddress?.isFirst == 1 {
                // 기본배송지
                cell.standardAddressImg.isHidden = false
            }else {
                // 기본배송지 아님
                cell.standardAddressImg.isHidden = true
            }
            
            cell.mainAddress.text = " \(selectAddress?.address ?? "")"
            
            if selectAddress?.detail_address != nil {
                cell.detailAddress.isHidden = false
                cell.detailAddress.text = " \(selectAddress?.detail_address ?? "")"
            }else {
                cell.detailAddress.isHidden = true
            }
            
            if ((selectAddress?.name) != nil) || ((selectAddress?.phoneNumber) != nil) {
                // 정보가 있을 때
                cell.blankView.isHidden = true
                cell.fullView.isHidden = false
                
                if selectAddress?.name == nil {
                    cell.nameLabel.text =
                    "\(selectAddress?.phoneNumber ?? "정보없음")"
                    
                    
                } else if selectAddress?.phoneNumber == nil {
                    cell.nameLabel.text = "\(selectAddress?.name ?? "정보없음")"
                } else {
                    cell.nameLabel.text = "\(selectAddress?.name ?? " ") \(selectAddress?.phoneNumber ?? " ")"
                    
                }
                
                if selectAddress?.detailAddressInfo == nil {
                    cell.recivePlaceLabel.isHidden = true
                    cell.doneLabel.isHidden = true
                }else {
                    cell.recivePlaceLabel.isHidden = false
                    cell.doneLabel.isHidden = false
                    cell.recivePlaceLabel.text = "\(selectAddress?.detailAddressInfo?.receiveSpace ?? " ") "
                    cell.doneLabel.text = "배송완료 메시지 \(selectAddress?.detailAddressInfo?.deliverCompletedMessage ?? " ")"
                }
                
            }else {
                // 정보 없을 때
                cell.blankView.isHidden = false
                cell.fullView.isHidden = true
            }
            
            cell.selectionStyle = .none
            return cell
        case 3 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "onlyBannerCell") as? OnlyBannerCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 4 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetFifthCell") as? OrderSheetFifthCell else {
                return UITableViewCell()
            }
            cell.couponTextField.placeholder = "사용 가능 쿠폰 0장 / 전체 \(userInfoManager.userCouponInfo?.count ?? 0)장"
            cell.selectionStyle = .none
            return cell
        case 5 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetSixCell") as? OrderSheetSixCell else {
                return UITableViewCell()
            }
            payIdx = cell.payIdx
            cell.selectionStyle = .none
            return cell
        case 6 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetSevenCell") as? OrderSheetSevenCell else {
                return UITableViewCell()
            }
            cell.salePriceLabel.text = DecimalWon(value: salePrice)
            cell.originPriceLabel.text = DecimalWon(value: originPrice)
            cell.discountPriceLabel.text = "-\(DecimalWon(value: discountPrice))"
            cell.deliveryLabel.text = DecimalWon(value: deliveryPrice)
            totalSalePrice = salePrice+deliveryPrice-couponDiscountPrice-pointDiscountPrice
            cell.totalPriceLabel.text = DecimalWon(value: totalSalePrice)
            pointTransform(totalPrice: totalSalePrice, pointLabel: cell.pointLabel)
            cell.selectionStyle = .none
            return cell
        case 7 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderSheetLastCell") as? OrderSheetLastCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.button.setTitle("\(DecimalWon(value: totalSalePrice)) 결제하기", for: .normal)
            cell.selectionStyle = .none
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
    // 하위 셀 넣기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemFirstCell", for: indexPath) as? OrderItemFirstCell else {
                return UITableViewCell()
            }
            let target = myCartList[indexPath.row-1]
            
            urlToImg(urlStr: target.getItemRes.items_img_url, img: cell.itemImg)
            cell.itemName.text = target.getItemRes.name
            
            if target.getItemRes.discount_rate == "0%" {
                cell.itemOrignPrice.isHidden = true
                cell.itemPrice.text = DecimalWon(value: target.getItemRes.price)
                
            }else {
                cell.itemOrignPrice.isHidden = false
                cell.itemPrice.text = DecimalWon(value: target.getItemRes.member_discount_price)
                cancleLine(text: DecimalWon(value: target.getItemRes.price), targetLabel: cell.itemOrignPrice)
            }
            cell.itemCnt.text = "\(target.count)개"
            
            
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderUserInfoSecondCell", for: indexPath) as? OrderUserInfoSecondCell else {
                return UITableViewCell()
            }
            cell.userName.text = userInfoManager.getUserName()
            cell.userPhone.text = userInfoManager.getUserPhone()
            cell.userEmail.text = userInfoManager.getUserEmail()
            return cell
        default :
            return UITableViewCell()
        }
    
    }
    
    // 선택후 동작하는 거 여기서 하기!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
                let storyboard = UIStoryboard(name: "Address", bundle: nil)
                guard let AddressDetailMoreVC = storyboard.instantiateViewController(identifier: "AddressDetailMoreSB") as? AddressDetailMoreViewController else {
                    return }
                AddressDetailMoreVC.selectAddress = selectAddress
                AddressDetailMoreVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(AddressDetailMoreVC, animated: true)
//                self.present(AddressDetailMoreVC, animated: true, completion: nil)
        }
        
        
        statusCell[indexPath.section] = !statusCell[indexPath.section]
        tableView.reloadData()
    }
    
    // cell 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 3 :
            return 80
        default :
            return UITableView.automaticDimension
        }
  
    }
}

















/*
 cell 높이
 //        switch indexPath.section {
 //        case 0 :
 //            // 섹션 높이는 60 , 하위 Cell 높이는 100 으로 설정
 //            if indexPath.row == 0 {
 //                return 60
 //            }else {
 //                return 100
 //            }
 //        case 1 :
 //            if indexPath.row == 0 {
 //                return 60
 //            }else {
 //                return 160
 //            }
 //        case 2 :
 //            return UITableView.automaticDimension
 //        case 3 :
 //             return 80
 //        case 4,5 :
 //            return 220
 //        case 6 :
 //            return 330
 //        case 7 :
 //            return 440
 //        default :
 //            return 0
 //        }
 
 
 
 
 */
