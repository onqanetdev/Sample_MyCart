//
//  HomeOneCellOne.swift
//  TestParamparaTemplate
//
//  Created by Onqanet on 27/06/25.
//

import UIKit

class HomeOneCellOne: UICollectionViewCell {
    
    
    @IBOutlet weak var imageSlider: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func bindData(index: Int) {

        imageSlider.sample("Ecommerce", "Candles", index)
    }
    
}
