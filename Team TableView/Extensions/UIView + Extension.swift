//
//  UIView + Extension.swift
//  Team TableView
//
//  Created by Рамил Гаджиев on 20.03.2022.
//

import UIKit

extension UIView {
    
    public func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
