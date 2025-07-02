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
        default:
            return 4
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
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
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? UICollectionViewCell else {fatalError("Unable deque cell...")}
            cell.backgroundColor = .orange
            return cell
            
        }
    }
    
    
}
