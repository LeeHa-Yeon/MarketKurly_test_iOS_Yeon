//
//  ProductsCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit



class ProductsCell: UITableViewCell {
    
    var delegate: ItemDetailViewControllerDelegate?
    
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
        let ProductCellNib = UINib(nibName: "ProductCell", bundle: nil)
        self.collectionView.register(ProductCellNib, forCellWithReuseIdentifier: "productCell")
        
        let NoSaleProductCellNib = UINib(nibName: "NoSaleProductCell", bundle: nil)
        self.collectionView.register(NoSaleProductCellNib, forCellWithReuseIdentifier: "noSaleProductCell")
    }
    
}

extension ProductsCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150  , height:  collectionView.frame.height)
    }

}
