//
//  TeamsVC + TVDataSource.swift
//  Team TableView
//
//  Created by Рамил Гаджиев on 21.03.2022.
//

import UIKit

extension TeamsViewController: UITableViewDataSource {
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        self.teams.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return teams[section].persons.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TeamCell.identifier,
            for: indexPath) as? TeamCell else {
                
                return UITableViewCell()
            }
        cell.configure(with: teams[indexPath.section].persons[indexPath.row])
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        canEditRowAt indexPath: IndexPath
    ) -> Bool {
        return true
    }
    
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            self.teams[indexPath.section].persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    func tableView(
        _ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath
    ) {
        // Update the model
        let mover = teams[sourceIndexPath.section].persons.remove(at: sourceIndexPath.row)
        teams[destinationIndexPath.section].persons.insert(mover, at: destinationIndexPath.row)
    }
}
