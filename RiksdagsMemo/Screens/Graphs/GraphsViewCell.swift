//
//  GraphsViewCell.swift
//  RiksdagsMemo
//
//  Created by Henrik on 2019-05-14.
//  Copyright © 2019 Henrik. All rights reserved.
//

import UIKit

class GraphsViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    
    static var identifier: String {
        return "GraphsViewCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
