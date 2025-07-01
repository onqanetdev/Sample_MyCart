//
//  HomeViewController.swift
//  TestParamparaTemplate
//
//  Created by Onqanet on 30/06/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let headerView = HeaderView()
    
    
    lazy var typeProductsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(TypeOfProdCollectionViewCell.self, forCellWithReuseIdentifier: TypeOfProdCollectionViewCell.cellIdentifier)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        cv.backgroundColor = .clear
        return cv
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHeaderView()
        configureUI()
        configureCompositionalLayout()
    }
    
    private func setupHeaderView() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 280) // Adjust height as needed
        ])
    }
    

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(typeProductsCollectionView)
        
        NSLayoutConstraint.activate([
            typeProductsCollectionView.topAnchor.constraint(equalTo: headerView.searchBar.bottomAnchor, constant: 10),
            typeProductsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            typeProductsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            typeProductsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    
}


//MARK: Compositional Layout Part

extension HomeViewController {
    
    
    //Defining Compositional layout
    
    func configureCompositionalLayout(){
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0:
                return self.typesOfProductsSection()
            default:
                return nil
            }
            
        }
        
        //layout.register(<#T##AnyClass?#>, forDecorationViewOfKind: <#T##String#>)
        typeProductsCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
    
    
    //Defining First Section
    func typesOfProductsSection() -> NSCollectionLayoutSection {
        //Item will take 100% of its Group Size
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Define Group size and Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        //Define Section which will Contain Group
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
}








