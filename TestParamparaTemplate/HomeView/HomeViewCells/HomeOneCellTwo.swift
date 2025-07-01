//
//  HomeOneCellTwo.swift
//  TestParamparaTemplate
//
//  Created by Onqanet on 27/06/25.
//

import UIKit

class HomeOneCellTwo: UICollectionViewCell {

    
    @IBOutlet weak var imageProduct: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func bindData(index: Int) {

        imageProduct.sample("Ecommerce", "Candles", index)
    }
}
