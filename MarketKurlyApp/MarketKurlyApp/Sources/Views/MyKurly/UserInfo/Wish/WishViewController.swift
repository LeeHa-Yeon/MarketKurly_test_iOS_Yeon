//
//  WishViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/19.
//

import UIKit

protocol AlertWishDelegate {
    func showAlert(itemIdx: Int)
}

extension WishViewController :AlertWishDelegate {
    func showAlert(itemIdx: Int) {
        let alert = UIAlertController(title: "삭제하시겠습니까?", message: nil, preferredStyle:  UIAlertController.Style.alert)
    
        let okAction = UIAlertAction(title: "삭제", style: .destructive) { (action) in
            
            let wishDataManager = WishDataManager.shared
            let userInfoManager = UserInfoManaer.shared
            
            let request: WishRequest = WishRequest(itemId: itemIdx)
            wishDataManager.requestDeleteWish(userId: userInfoManager.getUid(), token: userInfoManager.getToken(), para: request) { response in
                print(response)
                wishDataManager.requestMyWishList(userId: userInfoManager.getUid(), token: userInfoManager.getToken()) { response in
                    self.userInfoManager.setUserWishListInfo(response.result)
                    self.myWishList = response.result
                    self.totalCnt.text = "전체 \(self.myWishList.count)개"
                    self.tableView.reloadData()
                }
                
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}

class WishViewController: UIViewController {
    
    let userInfoManager = UserInfoManaer.shared
    var myWishList: [ShowWishListDocument] = []
    
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalCnt: UILabel!
    
   
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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
        naviTitleDelete(navi: self.navigationController!)
        customNavigationBarAttribute(.white, .black)
        customNaviBarItem(btnColor: .black, naviItem: self.navigationItem)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /* API 통신 */
    func loadData(){
        myWishList = userInfoManager.getUserWishListInfo()!
        totalCnt.text = "전체 \(myWishList.count)개"
        tableView.reloadData()
    }
}


extension WishViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myWishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "wishCell", for: indexPath) as? WishCell else {
            return UITableViewCell()
        }
        cell.delegate = self

        let target = myWishList[indexPath.row]
        cell.itemIdx = target.itemId
        urlToImg(urlStr: target.items_img_url, img: cell.itemImg)
        cell.itemName.text = target.name
        if target.discount_rate != nil {
            // 할인상품
            cell.itemDiscount.isHidden = false
            cell.itemOriginPrice.isHidden = false
            cell.itemDiscount.text = target.discount_rate
            cell.itemSalePrice.text = DecimalWon(value: target.member_discount_price)
            cancleLine(text: DecimalWon(value: target.price), targetLabel: cell.itemOriginPrice)
            
        }else {
            // 할인상품 아님
            cell.itemDiscount.isHidden = true
            cell.itemOriginPrice.isHidden = true
            cell.itemSalePrice.text = DecimalWon(value: target.price)
            
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

class WishCell: UITableViewCell {
    
    var delegate : AlertWishDelegate?
    
    let wishDataManager = WishDataManager.shared
    let userInfoManager = UserInfoManaer.shared
    
    // MARK: - Components
    var itemIdx: Int = 0
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDiscount: UILabel!
    @IBOutlet weak var itemSalePrice: UILabel!
    @IBOutlet weak var itemOriginPrice: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var cartAddBtn: UIButton!
    
    @IBAction func deleteBtnTapped(_ sender: Any) {
        self.delegate?.showAlert(itemIdx: self.itemIdx)
    }
    
    @IBAction func cartBtnTapped(_ sender: Any) {
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    func setUI(){
        deleteBtn.layer.borderWidth = 1
        deleteBtn.layer.borderColor = UIColor.lineColor.cgColor
        deleteBtn.layer.cornerRadius = 5
        cartAddBtn.layer.borderWidth = 1
        cartAddBtn.layer.borderColor = UIColor.mainKurlyPurple.cgColor
        cartAddBtn.layer.cornerRadius = 5
    }
    
}
