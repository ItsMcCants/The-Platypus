//
//  ChallengeCell.swift
//  PlatypusMVP
//
//  Created by John McCants on 2/22/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit
import Foundation



class ChallengeCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!

    @IBOutlet weak var badgeImage: UIImageView!


    @IBOutlet weak var cellBackground: UIImageView!


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

