//
//  TypeOfProdCollectionViewCell.swift
//  TestParamparaTemplate
//
//  Created by Onqanet on 01/07/25.
//

import UIKit

class TypeOfProdCollectionViewCell: UICollectionViewCell {

    
    static let cellIdentifier = "TypeOfProductCell"
    
    
    var cellData : TypesOfProducts? {
        didSet {
            guard let cellData = cellData else {return}
            titleProduct.text = cellData.nameOfType
        }
    }
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    private let titleProduct:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont(name: "Helvetica-Bold", size: 14)
        return lbl
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        contentView.addSubview(cellView)
            setUpView()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    
    func setUpView() {
            NSLayoutConstraint.activate([
                cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
                cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
            
            cellView.addSubview(titleProduct)
            NSLayoutConstraint.activate([
                titleProduct.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
                titleProduct.centerYAnchor.constraint(equalTo: cellView.centerYAnchor)
            ])
        }
}
