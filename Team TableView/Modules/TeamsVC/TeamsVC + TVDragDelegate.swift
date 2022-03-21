//
//  TeamsVC + TVDragDelegate.swift
//  Team TableView
//
//  Created by Рамил Гаджиев on 21.03.2022.
//

import UIKit

extension TeamsViewController: UITableViewDragDelegate {
    
    func tableView(
        _ tableView: UITableView,
        itemsForBeginning session: UIDragSession,
        at indexPath: IndexPath
    ) -> [UIDragItem] {
        
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = teams[indexPath.section].persons[indexPath.row]
           return [ dragItem ]
       }
}
