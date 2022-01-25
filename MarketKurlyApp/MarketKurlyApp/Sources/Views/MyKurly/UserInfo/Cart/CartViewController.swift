//
//  CartViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/16.
//

import UIKit
import GMStepper

class CartViewController: UIViewController {
    
    var selectCnt: Int = 0
    
    var originPrice: Int = 0
    var totalSalePrice: Int = 0
    var discountPrice: Int = 0
    
    let userInfoManager = UserInfoManaer.shared
    let cartDataManager = CartDataManager.shared
    let addressDataManager = AddressDataManager.shared
    var myCartList: [ShowCartListDocument] = []
    var selectAddress: CurrentSelectAddressDocument?
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fixView: UIView!
    
    
    @IBAction func dismissTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func OrderBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Order", bundle: nil)
        guard let OrderVC = storyboard.instantiateViewController(identifier: "OrderSB") as? OrderViewController else {
            return }
        self.navigationController?.pushViewController(OrderVC, animated: true)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
        let time = DispatchTime.now()
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.setAddress()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "장바구니"
    }
    
    // MARK: - Functions
    func setUI(){
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.bringSubviewToFront(self.fixView)
        customNavigationBarAttribute(.white, .black)
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.estimatedRowHeight = 130
    }
    
    func pointTransform(totalPrice: Int, pointLabel: UILabel){
        let levelInfo = userInfoManager.getUserLevelInfo()
        
        guard let levelInfo = levelInfo else {
            pointLabel.text = "로그인 후, 적립해택 제공"
            return
        }
        
        let point = levelInfo.pointsRate * 0.01 * Double(totalPrice)
        let pointUp = round(point*pow(10,0))/pow(10,0)
        pointLabel.text = "구매시 \(Int(pointUp))원 적립"
    }
    
    
    
    /* API 통신 부분 */
    func setData(){
        cartDataManager.requestShowCartList(userId: userInfoManager.getUid()) { response in
            self.myCartList = response.result
            self.selectCnt  = 0
            self.selectCnt = self.myCartList.count
        }
    }
    
    func setAddress(){
        addressDataManager.requestCurrentSelectAddress(userId: userInfoManager.getUid()) { response in
            self.selectAddress = response.result
            self.updateTable()
        }
    }
    
    func updateTable(){
        self.originPrice = 0
        self.totalSalePrice = 0
        self.discountPrice = 0
        self.tableView.reloadData()
    }
    
    
    
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1 :
            return myCartList.count
        default :
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "냉장 상품"
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 35
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myImage = UIImageView()
        myImage.frame = CGRect(x: 15, y: -10, width: 30, height: 33)
        myImage.image = UIImage(named: "I_water")
        
        
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 57, y: -10, width: UIScreen.main.bounds.size.width-30, height: 35)
        myLabel.textAlignment = .left
        myLabel.font = UIFont.boldSystemFont(ofSize: 17)
        myLabel.textColor = .black
        myLabel.backgroundColor = .white
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        
        let headerView = UIView()
        headerView.addSubview(myLabel)
        headerView.addSubview(myImage)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartHeaderCell", for: indexPath) as? CartHeaderCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            
            cell.selectCntLabel.text = "전체선택 (\(selectCnt)/\(myCartList.count))"
            
            if selectCnt == myCartList.count {
                let imageName = UIImage(named: "I_check")
                cell.selectBtn.setImage(imageName, for: .normal)
            } else {
                let imageName = UIImage(named: "uncheck")
                cell.selectBtn.setImage(imageName, for: .normal)
            }
            if selectAddress?.detail_address != nil {
                cell.selectAddress.text = "\(selectAddress?.address ?? "") \(selectAddress?.detail_address ?? "")"
            }else {
                cell.selectAddress.text = "\(selectAddress?.address ?? "")"
            }
            
            return cell
            
            
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartContentCell", for: indexPath) as? CartContentCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.delegate = self
            let target = myCartList[indexPath.row]
            cell.selectBasketIdx = target.basketId
            cell.itemName.text = target.getItemRes.name
            urlToImg(urlStr: target.getItemRes.items_img_url, img: cell.itemImage)
            
            cell.stepper.value = Double(target.count)
            
            if target.getItemRes.discount_rate == "0%" {
                // 할인 상품이 아닐때
                cell.salePrice.text = DecimalWon(value: target.getItemRes.price)
                
                cell.originPrice.isHidden = true
                
                totalSalePrice += target.getItemRes.price * target.count
                
                
            } else {
                // 할인 상품일때
                cell.salePrice.text = DecimalWon(value: target.getItemRes.member_discount_price)
                
                cell.originPrice.isHidden = false
                cancleLine(text: DecimalWon(value: target.getItemRes.price), targetLabel: cell.originPrice)
                
                totalSalePrice += target.getItemRes.member_discount_price * target.count
                
            }
            
            originPrice += target.getItemRes.price * target.count
            
            return cell
            
            
            
        default :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartFooterCell", for: indexPath) as? CartFooterCell else {
                return UITableViewCell()
            }
            cell.originTotalPrice.text = DecimalWon(value: originPrice)
            
            cell.discountTotalPrice.text = "-\(DecimalWon(value: originPrice-totalSalePrice))"
            cell.saleTotalPrice.text = DecimalWon(value: totalSalePrice)
            
            pointTransform(totalPrice: totalSalePrice, pointLabel: cell.pointLabel)
            
            
            cell.selectionStyle = .none
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



class CartHeaderCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var selectAddress: UILabel!
    @IBOutlet weak var selectCntLabel: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    
    
    @IBAction func changeSelectAddress(_ sender: Any) {
    }
    @IBAction func allCheckBtnTapped(_ sender: Any) {
        
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    // MARK: - Functions
    func setUI(){
    }
}

protocol CartVCDelegate {
    func updateVC()
}

extension CartViewController: CartVCDelegate {
    func updateVC(){
        selectCnt-=1
        originPrice = 0
        totalSalePrice = 0
        discountPrice = 0
        
        cartDataManager.requestShowCartList(userId: userInfoManager.getUid()) { response in
            self.myCartList = response.result
            self.tableView.reloadData()
        }
    }
}


class CartContentCell: UITableViewCell {
    
    var delegate: CartVCDelegate?
    
    var selectBasketIdx:Int?
    let cartDataManager = CartDataManager.shared
    
    // MARK: - Components
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var salePrice: UILabel!
    @IBOutlet weak var originPrice: UILabel!
    
    @IBOutlet weak var stepper: GMStepper!
    
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
        guard let basketIdx = selectBasketIdx else {
            return
        }
        cartDataManager.requestDeleteCart(basketId: basketIdx) { response in
            if response.isSuccess {
                self.delegate?.updateVC()
            }
        }
    }
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        customView(stepper, cornerValue: 3, viewBorderColor: #colorLiteral(red: 0.8375317454, green: 0.8376728892, blue: 0.8375131488, alpha: 1) , viewBorderWidth: 1)
        setStepper()
    }
    
    func setStepper(){
        stepper.value = 1
        stepper.minimumValue = 1
        stepper.buttonsTextColor = UIColor.black
        stepper.buttonsBackgroundColor = .clear
        stepper.buttonsFont =  UIFont ( name : "AvenirNext-Bold" , size : 14.0 )!
        stepper.labelTextColor = .black
        stepper.labelBackgroundColor = .clear
        stepper.labelFont =  UIFont ( name : "AvenirNext-Bold" , size : 14.0 )!
        
    }
    
    func customView(_ customView: UIView, cornerValue: CGFloat?, viewBorderColor: UIColor?, viewBorderWidth: CGFloat?){
        customView.layer.cornerRadius = cornerValue ?? 0
        customView.layer.borderColor = viewBorderColor?.cgColor
        customView.layer.borderWidth = viewBorderWidth ?? 0
    }
}

class CartFooterCell: UITableViewCell {
    
    // MARK: - Components
    
    @IBOutlet weak var priceContentView: UIView!
    @IBOutlet weak var originTotalPrice: UILabel!
    @IBOutlet weak var discountTotalPrice: UILabel!
    @IBOutlet weak var saleTotalPrice: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    // MARK: - Functions
    func setUI(){
        priceContentView.layer.addBorder([.bottom], color: UIColor.lineColor, width: 1.0)
        
    }
    
}
