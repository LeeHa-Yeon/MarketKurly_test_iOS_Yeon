//
//  ShareViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/15.
//

import UIKit

class ShareViewController: UIViewController {
    
    let brandData: [String] = ["카카오톡","라인","문자_(SMS)","페이스북","트위터","링크_복사"]
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemBgImg: UIImageView!
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    @IBAction func dismissTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
    
    // MARK: - Functions
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    /* API 호출되는 부분 */
    func setData(){
//        itemBgImg.image = 이미지 넣기
//        itemImg.image = 이미지 넣기
//        itemName.text = 이름 넣기
    }
}

extension ShareViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brandData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shareCell", for: indexPath) as? ShareCell else {
            return UITableViewCell()
        }
        cell.brandLogoImg.image = UIImage(named: brandData[indexPath.row])
        cell.shareTargetNameLabel.text = brandData[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentAlert(title: "앱 설치 후 이용 가능합니다.")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    
    
}


class ShareCell: UITableViewCell {
    @IBOutlet weak var brandLogoImg: UIImageView!
    @IBOutlet weak var shareTargetNameLabel: UILabel!
}
