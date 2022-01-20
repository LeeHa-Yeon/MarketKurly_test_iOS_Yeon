//
//  ColorRecommendViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit
import XLPagerTabStrip
import Kingfisher

protocol ItemDetailViewControllerDelegate {
    func moveToVC()
}



/* 서버에서 받아오는 데이터 (임시 구조체) */
struct TempProductListData {
    let name: String
    let price: String
    let created_at: String
    let item_img_url: String
    let discount_rate: String
    let member_discount: Int
}

class RecommendViewController: UIViewController, IndicatorInfoProvider {
    
    var tabName: String = ""
    let itemManager = ItemInfoManager.shared
    var subjectList: [AllSubjectDocument] = []
    
    // MARK: - UIComponents
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSubjectList()
        setUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        registerNib(cellNibName: "BannersCell", cellIdentifier: "bannersCell")
        registerNib(cellNibName: "ProductsCell", cellIdentifier: "productsCell")
        registerNib(cellNibName: "OnlyBannerCell", cellIdentifier: "onlyBannerCell")
        registerNib(cellNibName: "OtherProductsCell", cellIdentifier: "otherProductsCell")
        registerNib(cellNibName: "RecipeListCell", cellIdentifier: "recipeListCell")
        registerNib(cellNibName: "SpecialProductCell", cellIdentifier: "specialProductCell")
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.tableView.register(newCellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(tabName)")
    }
    
    /* API 통신 */
    func loadSubjectList() {
        subjectList = itemManager.getSubjectList() ?? []
        self.tableView.reloadData()
    }
    
}

extension RecommendViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // 이벤트배너, 컬리의레시피
        return subjectList.count + 3
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            // 이벤트 배너
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bannersCell", for: indexPath) as? BannersCell else {
                return UITableViewCell()
            }
            return cell
            
        case 2 :
            // 특가
            let item = itemManager.getItemList(subjectId: 2)[0]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "specialProductCell", for: indexPath) as? SpecialProductCell else {
                return UITableViewCell()
            }
            cell.specialTitleLabel.text  = "설날특가"
            cell.productPointLabel.text = "에너지를 위한 하루 한 개씩 "
            urlToImg(urlStr: item.items_img_url, img: cell.itemImg)
            cell.productLabel.text = item.name
            cell.discountLabel.text = item.discount_rate
            cell.salePriceLabel.text = DecimalWon(value: item.member_discount_price)
            cancleLine(text: DecimalWon(value: item.price) , targetLabel: cell.originPriceLabel)
            
            if item.present == 0 {
                cell.presentImg.isHidden = true
            } else {
                cell.presentImg.isHidden = false
            }
            
            if item.coupon == 0 {
                cell.couponImg.isHidden = true
            } else {
                cell.couponImg.isHidden = false
            }
        
            
            
            return cell
        case subjectList.count + 1 :
            // TODO: - 컬리의 레시피
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeListCell", for: indexPath) as? RecipeListCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "컬리의 레시피"
            return cell
            
        case subjectList.count + 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "onlyBannerCell", for: indexPath) as? OnlyBannerCell else {
                return UITableViewCell()
            }
            let imageName = UIImage(named: "E_banner")
            cell.bannerBtn.setImage(imageName, for: .normal)
            
            return cell
            
        default :
            
            let target = subjectList[indexPath.section-1]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            cell.titleLabel.text = target.homeSubject
            cell.itemList = itemManager.getItemList(subjectId: target.homeSubjectId)
            if indexPath.section == 1 {
                cell.moreBtn.isHidden = true
            }
            if target.vice_subject != nil {
                // 부제목이 있을 때
                cell.subExplanationLabel.text = target.vice_subject
            } else {
                // 부제목이 없을 때
                cell.subExplanationLabel.isHidden = true
            }
            return cell
        }
        
     
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 355
        case 2 :
            return 400
        case subjectList.count+1 :
            return 290
        case subjectList.count+2 :
            return 80
        default :
            return UITableView.automaticDimension
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
}

extension RecommendViewController: ItemDetailViewControllerDelegate {
    func moveToVC() {
        let storyboard = UIStoryboard(name: "Item", bundle: nil)
        let ItemDetailVC = storyboard.instantiateViewController(identifier: "ItemDetailSB")
        self.navigationController?.pushViewController(ItemDetailVC, animated: true)
    }
}


