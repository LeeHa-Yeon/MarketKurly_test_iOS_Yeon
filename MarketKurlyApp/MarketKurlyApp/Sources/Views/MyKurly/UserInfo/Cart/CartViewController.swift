//
//  CartViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/16.
//

import UIKit
import GMStepper

struct DummyData {
    let name: String
    let price: String
    let discountPrice: String
    let cnt: Int
    let img: String
}


class CartViewController: UIViewController {
    
    var dummyData = [DummyData]()
    
    // MARK: - Components
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fixView: UIView!
    
    
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
        self.view.bringSubviewToFront(self.fixView)
        customNavigationBarAttribute(.white, .black)
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.estimatedRowHeight = 130
    }
    
    /* API 통신 부분 */
    func setData(){
        dummyData.append(DummyData(name: "[아임웰 곤약잡곡 부드러운 닭가슴살 간장 계란밥]", price: "10,400원", discountPrice: "", cnt: 3, img:"testItem"))
        dummyData.append(DummyData(name: "[아임웰 곤약잡곡 부드러운 닭가슴살 간장 계란밥]", price: "10,400원", discountPrice: "", cnt: 3, img:"testItem"))
        dummyData.append(DummyData(name: "[아임웰 곤약잡곡 부드러운 닭가슴살 간장 계란밥]", price: "10,400원", discountPrice: "", cnt: 3, img:"testItem"))
    }
    
    
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1 :
            return dummyData.count
        default :
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartHeaderCell", for: indexPath) as? CartHeaderCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartContentCell", for: indexPath) as? CartContentCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
        default :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartFooterCell", for: indexPath) as? CartFooterCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}



class CartHeaderCell: UITableViewCell {
    
}

class CartContentCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var stepper: GMStepper!
    
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        customView(stepper, cornerValue: 3, viewBorderColor: #colorLiteral(red: 0.8375317454, green: 0.8376728892, blue: 0.8375131488, alpha: 1) , viewBorderWidth: 1)
        setStepper()
    }
    
    func setStepper(){
        stepper.value = 1
        stepper.minimumValue = 1
        stepper.buttonsTextColor = UIColor.black
        stepper.buttonsBackgroundColor = .clear
        stepper.buttonsFont =  UIFont ( name : "AvenirNext-Bold" , size : 14.0 )!
        stepper.labelTextColor = .black
        stepper.labelBackgroundColor = .clear
        stepper.labelFont =  UIFont ( name : "AvenirNext-Bold" , size : 14.0 )!
        
    }
    
    func customView(_ customView: UIView, cornerValue: CGFloat?, viewBorderColor: UIColor?, viewBorderWidth: CGFloat?){
        customView.layer.cornerRadius = cornerValue ?? 0
        customView.layer.borderColor = viewBorderColor?.cgColor
        customView.layer.borderWidth = viewBorderWidth ?? 0
    }
}

class CartFooterCell: UITableViewCell {
    
}
