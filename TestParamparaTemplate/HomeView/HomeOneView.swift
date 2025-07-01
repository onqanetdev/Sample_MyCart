//
//  HomeOneView.swift
//  TestParamparaTemplate
//
//  Created by Onqanet on 27/06/25.
//

import UIKit

class HomeOneView: UIViewController {
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    
    @IBOutlet weak var buttonProfile: UIButton!
    
    
    @IBOutlet weak var labelTitle: UILabel!
    
    
    @IBOutlet weak var labelSubTittle: UILabel!
    
    
    @IBOutlet weak var collectionViewSlider: UICollectionView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    
    
    
    @IBOutlet weak var layoutConstraintProductsHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        pageControl.numberOfPages = 5
        
        
        collectionViewSlider.delegate = self
        collectionViewSlider.dataSource = self
        
        collectionViewProducts.delegate = self
        collectionViewProducts.dataSource = self
        
        collectionViewSlider.register(UINib(nibName: "HomeOneCellOne", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeOneCellOne")
        collectionViewProducts.register(UINib(nibName: "HomeOneCellTwo", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeOneCellTwo")
        
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
        
        layoutConstraintProductsHeight.constant = collectionViewProducts.contentSize.height
    }
    
}




extension HomeOneView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == collectionViewSlider)        { return 5 }
        if (collectionView == collectionViewProducts)    { return 6 }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collectionViewSlider) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeOneCellOne", for: indexPath) as! HomeOneCellOne
            cell.bindData(index: indexPath.item)
            return cell
        }
        
        if (collectionView == collectionViewProducts) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeOneCellTwo", for: indexPath) as! HomeOneCellTwo
            cell.bindData(index: indexPath.item)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}



extension HomeOneView: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (collectionView == collectionViewSlider) {
            return collectionView.frame.size
        }
        
        if (collectionView == collectionViewProducts) {
            let width = (collectionView.frame.size.width-15)/2
            return CGSize(width: width, height: width)
        }
        
        return CGSize.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if (collectionView == collectionViewSlider)        { return 0 }
        if (collectionView == collectionViewProducts)    { return 15 }
        
        return 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if (collectionView == collectionViewSlider)        { return 0 }
        if (collectionView == collectionViewProducts)    { return 15 }
        
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if (collectionView == collectionViewSlider)        { return UIEdgeInsets.zero }
        if (collectionView == collectionViewProducts)    { return UIEdgeInsets.zero }
        
        return UIEdgeInsets.zero
    }
    
    
}



extension HomeOneView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: collectionViewSlider.contentOffset, size: collectionViewSlider.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        if let visibleIndexPath = collectionViewSlider.indexPathForItem(at: visiblePoint) {
            pageControl.currentPage = visibleIndexPath.row
        }
    }
}
