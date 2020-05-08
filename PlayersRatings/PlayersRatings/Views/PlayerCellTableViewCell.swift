//
//  PlayerCellTableViewCell.swift
//  PlayersRatings
//
//  Created by Alex Dodson on 5/7/20.
//  Copyright © 2020 Adam Dodson. All rights reserved.
//

import UIKit

class PlayerCellTableViewCell: UITableViewCell {

    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
