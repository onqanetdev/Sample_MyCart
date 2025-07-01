//
//  HomeViewController.swift
//  TestParamparaTemplate
//
//  Created by Onqanet on 30/06/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let headerView = HeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
    }
    
    private func setupHeaderView() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210) // Adjust height as needed
        ])
    }
}









