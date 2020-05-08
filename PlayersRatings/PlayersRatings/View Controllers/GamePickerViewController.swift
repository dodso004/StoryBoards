//
//  GamePickerViewController.swift
//  PlayersRatings
//
//  Created by Alex Dodson on 5/7/20.
//  Copyright © 2020 Adam Dodson. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {
    let gamesDataSource = GamesDataSource()
}

extension GamePickerViewController {
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        gamesDataSource.numberOfGames()
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        cell.textLabel?.text = gamesDataSource.gameName(at: indexPath)
        
        return cell
    }
}
