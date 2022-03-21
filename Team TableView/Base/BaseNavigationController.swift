//
//  BaseNavigationController.swift
//  Team TableView
//
//  Created by Рамил Гаджиев on 20.03.2022.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isTranslucent = false
        additionalSetup()
    }
    
    private func additionalSetup() {

            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowImage = nil
            appearance.shadowColor = .clear
        appearance.backgroundColor = .yellow
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.black
            ]
            appearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor.systemCyan
            ]
            
        UINavigationBar.appearance().tintColor = .darkGray
            
            navigationBar.standardAppearance = appearance
            navigationBar.compactAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            
    }
}
