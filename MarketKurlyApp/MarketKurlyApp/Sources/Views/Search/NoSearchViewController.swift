//
//  NoSearchViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/12.
//

import UIKit

class NoSearchViewController: UIViewController {
    
    @IBOutlet weak var searchImg: BaseImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchImg.tintColor = .yellow
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
