//
//  MyKurlyViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit

class NoMemberMyKurlyViewController: BaseViewController {
    
    let dummyData: [String] = ["비회원 주문 조회","알림 설정"]
    let dummyData2:[String] = ["컬리 소개","배송 안내","공지사항","자주하는 질문","고객센터","이용안내"]
    
    //MARK: - UIComponents
    @IBOutlet weak var tableView: UITableView!
    @IBAction func LoginBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let LoginVC = storyboard.instantiateViewController(identifier: "LoginSB")
        LoginVC.modalPresentationStyle = .fullScreen
        LoginVC.modalTransitionStyle = .coverVertical
        self.present(LoginVC, animated: true, completion: nil)
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    // MARK: - Function
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}

extension NoMemberMyKurlyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return dummyData.count
        case 2 :
            return dummyData2.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mykurlyCell", for: indexPath) as? MyKurlyCell else {
                return UITableViewCell()
            }
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyListCell", for: indexPath) as? MyKurlyListCell else {
                return UITableViewCell()
            }
            cell.listNameLabel.text = dummyData[indexPath.row]
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "myKurlyListCell", for: indexPath) as? MyKurlyListCell else {
                return UITableViewCell()
            }
            cell.listNameLabel.text = dummyData2[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 230
        default :
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 7
        if section == 0 || section == 1 {
            return cellSpacingHeight
        }
        return 0
    }
    
}
