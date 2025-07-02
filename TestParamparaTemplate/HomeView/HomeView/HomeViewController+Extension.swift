//
//  HomeViewController+Extension.swift
//  TestParamparaTemplate
//
//  Created by Onqanet on 01/07/25.
//

import Foundation
import UIKit





extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return typesOfProduct.count
        case 1:
            return bannerAd.count
        case 2:
            return grocery.count
        case 3:
            return trendingProducts.count
        default:
            return 4
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeOfProdCollectionViewCell.cellIdentifier, for: indexPath) as?
                    TypeOfProdCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = typesOfProduct[indexPath.row]
            return cell
            
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.cellIdentifier, for: indexPath) as?
                    BannerCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = bannerAd[indexPath.row]
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroceryCollectionViewCell.cellIdentifier, for: indexPath) as?
                    GroceryCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = grocery[indexPath.row]
            return cell
            
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingProductCollectionViewCell.cellIdentifier, for: indexPath) as?
                    TrendingProductCollectionViewCell else {fatalError("Unable deque cell...")}
            cell.cellData = trendingProducts[indexPath.row]
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? UICollectionViewCell else {fatalError("Unable deque cell...")}
            cell.backgroundColor = .orange
            return cell
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "Header" {
            switch indexPath.section {
            case 0:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AllProductsHeaderView.headerIdentifier, for: indexPath) as! AllProductsHeaderView
                //header.delegate = self
                header.backgroundColor = .yellow
                return header
                
            case 2:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GroceryKitchenHeaderView.headerIdentifier, for: indexPath) as! GroceryKitchenHeaderView
                //header.delegate = self
                return header
                
            case 3:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TrendingProductsHeaderView.headerIdentifier, for: indexPath) as! TrendingProductsHeaderView
               // header.backgroundColor = .clear
                //header.delegate = self
                return header
                
            default:
                let emptyHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "EmptyHeader", for: indexPath)
                return emptyHeader
            }
        } else {
            let emptyHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "EmptyHeader", for: indexPath)
            return emptyHeader
        }
    }
    
    
    
}
