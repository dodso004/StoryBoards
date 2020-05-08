//
//  PlayerDetailsViewController.swift
//  PlayersRatings
//
//  Created by Alex Dodson on 5/7/20.
//  Copyright © 2020 Adam Dodson. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    
    var game = "" {
        didSet {
            detailLabel.text = game
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        game = "chess"
    }
    
}

extension PlayersViewController {
    @IBAction func cancelToPlayersViewController(_ seque: UIStoryboardSegue) {
        print("Cancel was just pressed...")
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        print("Done was just pressed...")
    }
}
