//
//  TrendingProductsHeaderView.swift
//  TestParamparaTemplate
//
//  Created by Onqanet on 02/07/25.
//

import UIKit

class TrendingProductsHeaderView: UICollectionReusableView {
    
    
    static let headerIdentifier = "TrendingProductsHeaderView"
    
    private let headerTitle:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Trending Products"
        lbl.textColor = .black
        lbl.font = UIFont(name: "Helvetica-bold", size: 14)
        return lbl
    }()
    
    
    private let viewAll:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("View All", for: .normal)
        btn.setTitleColor(UIColor(.purple), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 13)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setUpHeaderView()
        //[allRestaurants,filterIcon,filterBtn,divider].forEach{addSubview($0)}
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpHeaderView(){
        addSubview(headerTitle)
        addSubview(viewAll)
        
        NSLayoutConstraint.activate([
            
            headerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            
            viewAll.centerYAnchor.constraint(equalTo: headerTitle.centerYAnchor),
            viewAll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
