//
//  CaraouselCollectionViewCell.swift
//  ComponentStudy
//
//  Created by ZUMIN YOU on 2022/05/31.
//

import UIKit

class CaraouselCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var countLabel: UILabel!
    var idx: String = "" {
        didSet {
            countLabel.text = idx
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        idx = ""
    }
}
