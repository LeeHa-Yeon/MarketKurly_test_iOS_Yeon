//
//  ExistSearchViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/12.
//

import UIKit

class ExistSearchViewController: UIViewController {

    // MARK: - UIComponents
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        collectionView.dataSource = self
        collectionView.delegate = self
        registerNib(cellNibName: "Product2Cell", cellIdentifier: "product2Cell")
    }
    
    func registerNib(cellNibName: String, cellIdentifier: String){
        let newCellNib = UINib(nibName: cellNibName, bundle: nil)
        self.collectionView.register(newCellNib, forCellWithReuseIdentifier: cellIdentifier)
    }

}

extension ExistSearchViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product2Cell", for: indexPath) as? Product2Cell else {
            return UICollectionViewCell()
        }
        cell.couponImg.alpha = 0
        return cell
    }
    
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin:CGFloat = 40
        let cellRatio: CGFloat = 5/3
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth =  (screenWidth-margin) / CGFloat(2)
        let cellHeight = cellWidth * cellRatio + 60
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}

