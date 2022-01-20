//
//  RecipeListCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class RecipeListCell: UITableViewCell {
    
    let dummyData = ["쪽파무침","오렌지 마멀레이드","모둠 버섯 전골","뚝배기 계란찜","마 우동"]

    // MARK: - UIComponents
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var moreBtn: UIButton!
    
    @IBAction func moreProductsBtnTapped(_ sender: Any) {
        //TODO: - 전체보기 페이지 구현
        print("전체보기 탭함")
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    private func setUI(){
        collectionView.dataSource = self
        collectionView.delegate = self
        let RecipeCellNib = UINib(nibName: "RecipeCell", bundle: nil)
        self.collectionView.register(RecipeCellNib, forCellWithReuseIdentifier: "recipeCell")
        
    }
    
}

extension RecipeListCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath) as? RecipeCell else {
            return UICollectionViewCell()
        }
        let itemImg = UIImage(named: "E_recipe\(indexPath.row)")
        cell.RecipeBtn.setImage(itemImg, for: .normal)
        cell.cookTitleLabel.text = dummyData[indexPath.row]
        return cell
        
    }
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240  , height:  collectionView.frame.height+10)
    }
    
}
