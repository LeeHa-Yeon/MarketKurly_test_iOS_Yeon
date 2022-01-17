//
//  OrderViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/17.
//

import UIKit
import ExpyTableView


struct DummyOrderItem {
    let name: String
    let price: Int
    let discountPrice: Int?
    let cnt: Int
}


class OrderViewController: UIViewController {
    
    var statusCell = [false,false,false,false,false,false,false,false]
    var dummyOrderItemes: [DummyOrderItem] = []
    
    // MARK: - Components
    @IBOutlet weak var tableView: ExpyTableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setUI()
    }
    
    
    // MARK: - Functions
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        customNavigationBarAttribute(.white, .black)
        naviTitleDelete(navi: self.navigationController!)
        
    }
    
    /* API 통신할 부분 */
    func setData(){
        dummyOrderItemes.append(DummyOrderItem(name: "[KF365] 깐마늘 200g", price: 2800, discountPrice: nil, cnt: 1))
        dummyOrderItemes.append(DummyOrderItem(name: "친환경 남해초 200g", price: 3000, discountPrice: nil, cnt: 1))
        dummyOrderItemes.append(DummyOrderItem(name: "[쿠치나 안티카] 선 드라이드 토마토 (투토솔)", price: 41970, discountPrice: 30420, cnt: 3))
        dummyOrderItemes.append(DummyOrderItem(name: "[한일관 X 백년가게] 등심 불고기", price: 29000, discountPrice: nil, cnt: 1))
        dummyOrderItemes.append(DummyOrderItem(name: "[뱅앤베이커스] 버터 쿠키 클래식", price: 20000, discountPrice: 1430, cnt: 2))
    }
}

extension OrderViewController: ExpyTableViewDelegate, ExpyTableViewDataSource {
    
    
    //섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //row 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return dummyOrderItemes.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        print("\(section)섹션")
        
        switch state {
        case .willExpand:
            print("WILL EXPAND")
        case .willCollapse:
            print("WILL COLLAPSE")
        case .didExpand:
            print("DID EXPAND")
        case .didCollapse:
            print("DID COLLAPSE")
        }
    }
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        // 0,1,3
        switch section {
            
        case 0 :
            return true
        default :
            return false
        }
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
                cell.itemCnt.isHidden = false
                cell.arrowImg.image = UIImage(named: "bottomArrow")
            }
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
    // 하위 셀 넣기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "orderItemFirstCell", for: indexPath) as? OrderItemFirstCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    // 선택후 동작하는 거 여기서 하기!
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)섹션 \(indexPath.row)로우 선택됨")
        statusCell[indexPath.section] = !statusCell[indexPath.section]
        tableView.reloadData()
    }
    
    // cell 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 섹션 높이는 40 , 하위 Cell 높이는 60 으로 설정
        if indexPath.row == 0 {
            return 60
        }else {
            return 100
        }
    }
}

// 주문상품
class OrderSheetFirstCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCnt: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }
    
    // MARK: - Functions
    func setUI(){
        
    }
}

class OrderItemFirstCell: UITableViewCell {
    
    // MARK: - Components
    
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
        
    }
}

// 주문자 정보
class OrderSheetSecondCell: UITableViewCell {
    
}

// 배송지
class OrderSheetThirdCell: UITableViewCell {
    
}

// 배너는 이미 있으니 넘어가


// 쿠폰 적립금
class OrderSheetFifthCell: UITableViewCell {
    
}
// 결제 수단

class OrderSheetSixCell: UITableViewCell {
    
}
// 결제 금액
class OrderSheetSevenCell: UITableViewCell {
    
}

// 결제 진행 필수 동의

class OrderSheetLastCell: UITableViewCell {
    
}
