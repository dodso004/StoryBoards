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
    
    var player: Player?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        game = "chess"
        nameTextField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SavePlayerDetail",
             let playerName = nameTextField.text,
             let gameName = detailLabel.text {
            player = Player(name: playerName, game: gameName, rating: 1)
        }
        
        if segue.identifier == "PickGame",
            let gamePickerViewController = segue.destination as? GamePickerViewController {
            gamePickerViewController.gamesDataSource.selectedGame = game
        }
    }
    
}

extension PlayersViewController {
    @IBAction func cancelToPlayersViewController(_ seque: UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        guard
            let playerDetailsViewController = segue.source as? PlayerDetailsViewController,
            let player = playerDetailsViewController.player
            else {
                return
        }
        playersDataSource.append(player: player, to: tableView)
    }
}

extension PlayerDetailsViewController {
    @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
        //      print ("A selection is made. Unwind the segue")
        print(game)
        if let gamePickerViewController = segue.source as? GamePickerViewController,
            let selectedGame = gamePickerViewController.gamesDataSource.selectedGame {
            game = selectedGame
        }
        print(game)
    }
}
