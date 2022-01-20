//
//  ItemReviewViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit
import XLPagerTabStrip

class ItemReviewViewController: UIViewController,IndicatorInfoProvider {
    
    var tabName: String = ""
    
    let notionDummyData: [String] = ["금주의 Best 후기 안내", "상품 후기 적립금 정책 안내"]
    
    let titleDummyData:[String] = ["좋아요^^","싱싱해요~","신선하고 좋아요","맛있어요","좋아요","자주사요"]
    let nameDummyData:[String] = ["김*미","최*아","이*호","조*라","양*정","박*영"]
    let isMember: [Bool] = [true,false,true,true,false,false]
    
    @IBAction func writeReviewTapped(_ sender: Any) {
        presentAlert(title: "미구현")
    }
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var writeBtn: UIButton!
    

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
        customButton(writeBtn, cornerValue: 5, btnBorderColor: UIColor.mainKurlyPurple, btnBorderWidth: 1)
    }
    
    func moveToVC(SBName: String, SBId: String ,VCName: String){
        let storyboard = UIStoryboard(name: SBName, bundle: nil)
        let VCName = storyboard.instantiateViewController(identifier: SBId)
        self.navigationController?.pushViewController(VCName, animated: true)
    }
    
}

extension ItemReviewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 2
        case 1 :
            return 6
        default :
            assert(false)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "reviewNotionCell", for: indexPath) as? ReviewNotionCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.title.text = notionDummyData[indexPath.row]
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "reviewListCell", for: indexPath) as? ReviewListCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.title.text = titleDummyData[indexPath.row]
            cell.name.text = nameDummyData[indexPath.row]
            if indexPath.row == 0 || indexPath.row == 1 {
                cell.bestImg.isHidden = false
            }else {
                cell.bestImg.isHidden = true
            }
            if isMember[indexPath.row] {
                cell.memberImg.isHidden = false
            } else {
                cell.memberImg.isHidden = true
            }
            
            return cell
        default :
            return UITableViewCell()

        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToVC(SBName: "Item", SBId: "ShowReviewSB", VCName: "ShowReviewVC")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 80
        }
        return UITableView.automaticDimension
    }
    
    
}


class ReviewNotionCell: UITableViewCell {
    
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


class ReviewListCell: UITableViewCell {
    
        // MARK: - Components

    @IBOutlet weak var bestImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var memberImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    
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
