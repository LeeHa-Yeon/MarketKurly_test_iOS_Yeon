//
//  OtherProductsCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit
import Kingfisher

class OtherProductsCell: UITableViewCell {
    
    var delegate: ItemDetailViewControllerDelegate?
    var itemList: [SubjectItemesDocument] = []
    
    // MARK: - UIComponents
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subExplanationLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func moreBtnTapped(_ sender: Any) {
        print("미구현")
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

extension OtherProductsCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let target = itemList[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
        
        urlToImg(urlStr: target.items_img_url, targetImg: cell.itemImg)
        // 카트
        cell.itemName.text = target.name
        
        if target.present == 0 {
            cell.presentImg.isHidden = true
        }else {
            cell.presentImg.isHidden = false
        }
        
        if target.coupon == 0 {
            cell.couponImg.isHidden = true
        } else {
            cell.couponImg.isHidden = false
        }
        
        if target.discount_rate == "0%" {
            // 세일 안할때
            cell.discountLabel.isHidden = true
            cell.originLabel.isHidden = true
            cell.saleLabel.text = DecimalWon(value: target.price)
            
        } else {
            // 세일할때
            cell.discountLabel.text = target.discount_rate
            cancleLine(text: DecimalWon(value: target.price), targetLabel: cell.originLabel)
            cell.saleLabel.text = DecimalWon(value: target.member_discount_price)
            
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ProductsCell 동작합니다.")
        self.delegate?.moveToVC()
    }
    
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150  , height:  collectionView.frame.height)
    }

}
