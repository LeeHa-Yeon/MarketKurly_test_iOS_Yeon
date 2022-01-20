//
//  CategoryListCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/13.
//

import UIKit
import ExpyTableView
import Kingfisher

class CategoryListCell: UITableViewCell {
    
    let categoryDataManager = CategoryDataManger.shared
    var tempCategory: [CategoryListDocument] = []
    
    let categoryList: Array<String> = ["설 선물세트","채소","과일,견과,쌀","수산,해산,건어물","정육,계란","국,반찬,메인요리","샐러드,간편식","면,양념,오일","생수,음료,우유,커피","간식,과자,떡","베이커리,치즈,델리","건강식품","전통주","생활용품,리빙,캠핑","스킨케어,메이크업","헤어,바디,구강","주방용품","가전제품","반려동물","베이비,키즈,완구"]
    let categoryDummyData: [[String]] = [["","=== 카테고리별 ===","홍삼·즙·건강식품","정육·가공육·건육","수산·건어물·젓갈","과일·견과·곡류","디저트·치즈·다과류","면·양념·오일·캔류","생활·주방·뷰티","생활·주방·뷰티","간편식·반찬","=== 가격대별 ===","3만원 미만","5~10만원","10-20만원","20만원 이상"],["","친환경","고구마·감자·당근","시금치·쌈채소·나물","브로콜리·파프리카·양배추","양파·대파·마늘·배추","오이·호박·고추","냉동·이색·간편채소","콩나물·버섯"],["","친환경","제철과일","국산과일","수입과일","간편과일","냉동·건과일","견과류","쌀·잡곡"],["","제철수산"],["","국내산 소고기"],["","국·탕·찌개"],["","샐러드·닭가슴살"],["","파스타·면류"],["","생수·탄산수"],["","과자·스낵·쿠키"],["","식빵·빵류"],["","영양제"],["","막걸리·약주"],["","휴지·티슈"],["","스킨·미스트·패드"],["","구강·면도"],["","주방소모품·잡화"],["","주방가전"],["","강아지 간식"],["","분유·간편 이유식"]]
    
    
    // MARK: - Components
    @IBOutlet weak var tableView: ExpyTableView!

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setData()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Function
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = #colorLiteral(red: 0.9567895532, green: 0.9569039941, blue: 0.9567505717, alpha: 1)
        registerNib(cellNibName: "CategoryChildCell", cellIdentifier: "categoryChildCell")
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.tableView.register(newCellNib, forCellReuseIdentifier: cellIdentifier)
    }

    /* API 통신 */
    func setData(){
        categoryDataManager.requestCategoryList { response in
            self.tempCategory = response.result
            self.tableView.reloadData()
        }
    }
    
}

extension CategoryListCell: ExpyTableViewDelegate, ExpyTableViewDataSource {
    
    // 섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count
//        return tempCategory.count
    }
    
    // 선택시 어떤 셀이 선택되었는지 이벤트를 처리
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(categoryList[indexPath.row]) - \(categoryDummyData[indexPath.section][indexPath.row])")

    }
    
    // cell 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
//        if indexPath.row == 0 {
//            // 섹션의 높이
//            return 48
//        }else {
//            // 하위 셀의 높이
//            return 50
//        }
    }
    
    
    // Expand 활성화 여부 (true 가능 , false 면 다 펼쳐진 상태로 나오고 접었다 폈다 안됨)
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    // row 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryDummyData[section].count
//        if section == 0 {
//            return arraySection0.count
//        } else {
//            return arraySection1.count
//        }
    }
    
     // 열리고 닫힐 때 확인
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        print("\(section)섹션")

//        switch state {
//        case .willExpand:
//            print("WILL EXPAND")
//
//        case .willCollapse:
//            print("WILL COLLAPSE")
//
//        case .didExpand:
//            print("DID EXPAND")
//
//        case .didCollapse:
//            print("DID COLLAPSE")
//        }
    }
    
    // 섹션 내용
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryParentCell") as? CategoryParentCell else {
            return UITableViewCell()
        }
        if section < tempCategory.count-1 && section > 0 {
            let target = tempCategory[section-1]
            urlToImg(urlStr: target.imageULR, targetImg: cell.categoryImg)
        }
        
        cell.categoryNameLabel.text = categoryList[section]
        cell.selectionStyle = .none //선택했을 때 회색되는거 없애기
        return cell

    }
    
    // row 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryChildCell", for: indexPath) as? CategoryChildCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = #colorLiteral(red: 0.9086460471, green: 0.9014798999, blue: 0.9141244292, alpha: 1)
        cell.selectionStyle = .none
        cell.nameLabel.text = categoryDummyData[indexPath.section][indexPath.row]
        return cell
        
    }
    
    
    
}
