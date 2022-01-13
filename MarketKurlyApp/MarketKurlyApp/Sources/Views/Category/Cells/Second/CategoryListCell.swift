//
//  CategoryListCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/13.
//

import UIKit
import ExpyTableView

class CategoryListCell: UITableViewCell {
    
    let categoryList: Array<String> = ["설 선물세트","채소","과일,견과,쌀","수산,해산,건어물","정육,계란","국,반찬,메인요리","샐러드,간편식","면,양념,오일","생수,음료,우유,커피","간식,과자,떡","베이커리,치즈,델리","건강식품","전통주","생활용품,리빙,캠핑","스킨케어,메이크업","헤어,바디,구강","주방용품","가전제품","반려동물","베이비,키즈,완구"]
    let arraySection0: Array<String> = ["section0_row0","section0_row1","section0_row2"]
    let arraySection1: Array<String> = ["section1_row0","section1_row1","section1_row2","section1_row3"]
    
    // MARK: - Components
    @IBOutlet weak var tableView: ExpyTableView!

    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
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

}

extension CategoryListCell: ExpyTableViewDelegate, ExpyTableViewDataSource {
    
    // 섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count
    }
    
    // 선택시 어떤 셀이 선택되었는지 이벤트를 처리
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0 :
            print("\(categoryList[indexPath.row]) - \(arraySection0[indexPath.row])")
        case 1 :
            print("\(categoryList[indexPath.row]) - \(arraySection1[indexPath.row])")
        default :
            print("\(indexPath.section)섹션 \(indexPath.row)로우 선택됨")
        }
    }
    
    // cell 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            // 섹션의 높이
            return 48
        }else {
            // 하위 셀의 높이
            return 50
        }
    }
    
    
    // Expand 활성화 여부 (true 가능 , false 면 다 펼쳐진 상태로 나오고 접었다 폈다 안됨)
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    // row 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arraySection0.count
        } else {
            return arraySection1.count
        }
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
        if indexPath.section == 0 {
            cell.nameLabel.text = arraySection0[indexPath.row]
        } else {
            cell.nameLabel.text = arraySection1[indexPath.row]
        }
        return cell
        
    }
    
    
    
}
