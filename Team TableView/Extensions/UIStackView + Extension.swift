//
//  UIStackView + Extension.swift
//  Team TableView
//
//  Created by Рамил Гаджиев on 20.03.2022.
//

import UIKit
import Foundation

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for v in views {
            self.addArrangedSubview(v)
        }
    }
}
