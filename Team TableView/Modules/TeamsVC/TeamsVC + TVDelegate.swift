//
//  TeamsVC + TVDelegate.swift
//  Team TableView
//
//  Created by Рамил Гаджиев on 21.03.2022.
//

import UIKit

extension TeamsViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        return UIView()
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: HeaderView.identifier
        ) as? HeaderView else {
            return nil
        }
        
        headerView.configure(with: teams[section].attributes)
        return headerView
    }
}
