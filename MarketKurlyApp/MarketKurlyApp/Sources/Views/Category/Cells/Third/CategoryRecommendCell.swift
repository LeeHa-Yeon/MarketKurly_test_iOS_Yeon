//
//  CategoryRecommendCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/13.
//

import UIKit

class CategoryRecommendCell: UITableViewCell {
    
    // MARK: - Components
    @IBOutlet weak var collectionView: UICollectionView!
    
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
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CategoryRecommendCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kurlyRecommendCell", for: indexPath) as? KurlyRecommendCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 50.0
        let width = (collectionView.frame.width - margin) / 2
        let height = width - 5
        
        return CGSize(width: width  , height:  height)
    }
    
    
}
