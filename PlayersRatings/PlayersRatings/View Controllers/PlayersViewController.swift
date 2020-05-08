//
//  PlayersViewController.swift
//  PlayersRatings
//
//  Created by Alex Dodson on 5/7/20.
//  Copyright © 2020 Adam Dodson. All rights reserved.
//

import UIKit
class PlayersViewController: UITableViewController {
    var playersDataSource = PlayersDataSource()
}

extension PlayersViewController {
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        playersDataSource.numberOfPlayers()
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "PlayerCell",
            for: indexPath) as! PlayerCell
        
        cell.player = playersDataSource.player(at: indexPath)
        
        return cell
    }
}
