//
//  ColorRecommendViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit
import XLPagerTabStrip

class RecommendViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var tabName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        registerNib(cellNibName: "BannersCell", cellIdentifier: "bannersCell")
        registerNib(cellNibName: "ProductsCell", cellIdentifier: "productsCell")
        registerNib(cellNibName: "OnlyBannerCell", cellIdentifier: "onlyBannerCell")
        registerNib(cellNibName: "OtherProductsCell", cellIdentifier: "otherProductsCell")
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.tableView.register(newCellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(tabName)")
    }
    
}

extension RecommendViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 21
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bannersCell", for: indexPath) as? BannersCell else {
                return UITableViewCell()
            }
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell", for: indexPath) as? ProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "이 상품 어때요?"
            cell.moreBtn.alpha = 0
            return cell
        case 2,6,21 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "onlyBannerCell", for: indexPath) as? OnlyBannerCell else {
                return UITableViewCell()
            }
            return cell
        case 3 :
            // TODO: - 나중에 설날특가로 바뀔 예정
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "onlyBannerCell", for: indexPath) as? OnlyBannerCell else {
                return UITableViewCell()
            }
            return cell
        case 4 :
            // 이건 할인된 상품만
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell", for: indexPath) as? ProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "놓치면 후회할 가격"
            return cell
        case 5 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell", for: indexPath) as? ProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "후기 1,000개 돌파 상품"
            return cell
        case 7 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell", for: indexPath) as? ProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "지금 가장 핫한 상품"
            return cell
        case 8 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "인기 신상품 랭킹"
            cell.subExplanationLabel.text = "가장 먼저 만나보는 인기 신상품"
            return cell
        case 9 :
            // TODO: - MD의 추천
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "onlyBannerCell", for: indexPath) as? OnlyBannerCell else {
                return UITableViewCell()
            }
            return cell
        case 10 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "공유가 많은 상품 랭킹"
            cell.subExplanationLabel.text = "최근 2주간 공유가 가장 많았어요"
            return cell
        case 11 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "후기 수로 검증된 신상품"
            cell.subExplanationLabel.text = "최근 한달 간 많은 후기가 달렸어요"
            return cell
        case 12 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell", for: indexPath) as? ProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "국 반찬 인기 급상승 랭킹"
            return cell
        case 13 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "5만원대 구매가 많은 인기상품"
            cell.subExplanationLabel.text = "최근 2주간 판매량이 가장 많았어요"
            return cell
        case 14 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "할매 입맛 사로잡은 간식"
            cell.subExplanationLabel.text = "인절미부터 흑임자까지, 취향 저격 간식"
            return cell
        case 15 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productsCell", for: indexPath) as? ProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "Kurly Only 추천 상품"
            return cell
        case 16 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "리빙 & 청소 아이템 특가"
            cell.subExplanationLabel.text = "새해를 맞아 우리집을 새롭게 꾸며보세요!"
            return cell
        case 17 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "일본 미식 여행"
            cell.subExplanationLabel.text = "간편하게 조리할 수 있는 일식 요리부터 향신료까지"
            return cell
        case 18 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "컬리의 기준, Kurly's"
            cell.subExplanationLabel.text = "퀄리티는 높게, 가격은 합리적으로"
            return cell
        case 19 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherProductsCell", for: indexPath) as? OtherProductsCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "한국인의 소울푸드, 치킨"
            cell.subExplanationLabel.text = "바삭바삭한 치킨과 맥주 한 잔으로 기분 전환"
            return cell
        case 20 :
            // TODO: - 컬리의 레시피
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "onlyBannerCell", for: indexPath) as? OnlyBannerCell else {
                return UITableViewCell()
            }
            return cell
            
        default :
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 340
        case 1,4,5,7,12,15 :
            return 350
        case 2,6,21 :
            return 80
        case 3,9,20 :
            return 80
        default :
            return 390
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    
}
