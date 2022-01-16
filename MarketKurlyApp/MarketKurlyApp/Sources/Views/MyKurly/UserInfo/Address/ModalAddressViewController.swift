//
//  ModalAddressViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/16.
//

/*
 이와 같은 경고가 뜸... 
 2022-01-16 17:59:17.233168+0900 MarketKurlyApp[13163:5352502] [Warning] Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a table view cell's content view. We're considering the collapse unintentional and using standard height instead. Cell: <MarketKurlyApp.AddNewAddressCell: 0x129d687c0; baseClass = UITableViewCell; frame = (0 316.667; 390 44); clipsToBounds = YES; autoresize = W; layer = <CALayer: 0x281473a20>>
 
 */

import UIKit

class ModalAddressViewController: UIViewController {

    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 130
    }
}

extension ModalAddressViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 2
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as? AddressCell else {
                return UITableViewCell()
            }
            return cell
        default :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addNewAddressCell", for: indexPath) as? AddNewAddressCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

class AddressCell: UITableViewCell {
    
    
}

class AddNewAddressCell: UITableViewCell {
    
}
