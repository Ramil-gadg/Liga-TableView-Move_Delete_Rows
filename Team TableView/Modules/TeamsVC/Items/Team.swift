//
//  Team.swift
//  Team TableView
//
//  Created by Рамил Гаджиев on 15.03.2022.
//

import UIKit

struct Team {
    
    var attributes: TeamType
    var persons: [Person]
}

enum TeamType: String, CaseIterable {
    case barsa = "Barcelona"
    case real = "Real Madrid"
    case cska = "CSKA"
    case bavaria = "Bavaria"
    
    var shortName: String {
        switch self {
            
        case .barsa:
            return "barsa"
        case .real:
            return "real"
        case .cska:
            return "cska"
        case .bavaria:
            return "bavaria"
        }
    }
    
    var logo: UIImage? {
        UIImage(named: self.shortName)
    }
    
}
