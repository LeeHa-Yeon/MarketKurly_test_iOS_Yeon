//
//  OtherProductsCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class OtherProductsCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subExplanationLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func moreBtnTapped(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUI(){
        collectionView.dataSource = self
        collectionView.delegate = self
        let ProductCellNib = UINib(nibName: "ProductCell", bundle: nil)
        self.collectionView.register(ProductCellNib, forCellWithReuseIdentifier: "productCell")
        
        let NoSaleProductCellNib = UINib(nibName: "NoSaleProductCell", bundle: nil)
        self.collectionView.register(NoSaleProductCellNib, forCellWithReuseIdentifier: "noSaleProductCell")
        
    }
    
}

extension OtherProductsCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row >= 0 && indexPath.row < 5 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell else {
                return UICollectionViewCell()
            }
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noSaleProductCell", for: indexPath) as? NoSaleProductCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        
        
    }
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150  , height:  collectionView.frame.height)
    }
    
    
    
}
