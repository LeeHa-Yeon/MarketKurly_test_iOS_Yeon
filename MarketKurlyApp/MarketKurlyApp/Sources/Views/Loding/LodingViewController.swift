//
//  LodingViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

import UIKit

class LodingViewController: UIViewController {
    
    let subjectManager = SubjectItemDataManager.shared
    let itemManager = ItemInfoManager.shared
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //2-3초 뒤에 작동하게끔.
        setData()
    }
    
    // MARK: - Functions
    func setUI(){
        
    }
    
    func moveToVC(){
        let time = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: time) {
            
            let board = UIStoryboard(name: "Main", bundle: nil)
            let vc = board.instantiateViewController(withIdentifier: "rootTabBarSB")
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
//            print(self.itemManager.getItemList(subjectId: 5))
            self.present(vc, animated: true, completion: nil)
            
        }
    }
    
    /* API 연동 */
    func setData(){
        subjectManager.requestSubjectList { response in
            self.itemManager.setSubjectList(response.result)
            for i in 0..<response.result.count {
                self.subjectManager.requestSubjectItems(subjectId: response.result[i].homeSubjectId) { response2 in
                    self.itemManager.addItemList(subjectId: response.result[i].homeSubjectId, itemList: response2.result)
                }
            }
            self.moveToVC()
        }
    }

}
