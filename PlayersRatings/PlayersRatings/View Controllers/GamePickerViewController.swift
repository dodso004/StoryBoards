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
        
        if indexPath.row == gamesDataSource.selectedGameIndex {
        cell.accessoryType = .checkmark
    } else {
    cell.accessoryType = .none
    }
        
        return cell
    }
}

extension GamePickerViewController {
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        // Remove the gray selection background that appears by default.
        tableView.deselectRow(at: indexPath, animated: true)
        // Get the previously selected game and remove the checkmark from its cell.
        if let index = gamesDataSource.selectedGameIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        // Select the new game in the data source
        gamesDataSource.selectGame(at: indexPath)
        // Mark the new cell with the checkmark
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        performSegue(withIdentifier: "unwind", sender: cell)
    }
}
