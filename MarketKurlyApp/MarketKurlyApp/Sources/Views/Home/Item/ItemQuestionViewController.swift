//
//  ItemQuestionViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit
import XLPagerTabStrip

class ItemQuestionViewController: UIViewController, IndicatorInfoProvider {
    
    var tabName: String = ""
    let questionDummy: [String] = ["환불해주세요","","","문의합니다.","배송이 지연 되었어요.","","잘못된 상품이 온 것 같아요.","","",""]
    @IBOutlet weak var questBtn: UIButton!
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(tabName)")
    }
    
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        customButton(questBtn, cornerValue: 5, btnBorderColor: UIColor.mainKurlyPurple, btnBorderWidth: 1)
    }
    
}


extension ItemQuestionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1 :
            return 10
        default :
            assert(false)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "questionNotionCell", for: indexPath) as? QuestionNotionCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 1:
            if questionDummy[indexPath.row] == "" {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "secretQuestionCell", for: indexPath) as? SecretQuestionCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "noQuestionCell", for: indexPath) as? NoQuestionCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
                cell.title.text = questionDummy[indexPath.row]
                return cell
            }
        default :
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0 :
            return 50
        case 1:
            return 80
        default :
            assert(false)
        }
    }
    
}

class QuestionNotionCell: UITableViewCell {
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







class SecretQuestionCell: UITableViewCell {
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

class NoQuestionCell: UITableViewCell {
    // MARK: - Components

    @IBOutlet weak var title: UILabel!
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
