//
//  ViewController.swift
//  Team TableView
//
//  Created by Рамил Гаджиев on 15.03.2022.
//

import UIKit

class TeamsViewController: UIViewController {
    
    var teams: [Team] = [Team(attributes: .barsa,
                              persons: []
                             ),
                         Team(attributes: .bavaria,
                              persons: []
                             ),
                         Team(attributes: .cska,
                              persons: []
                             ),
                         Team(attributes: .real,
                              persons: []
                             )
    ]
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.backgroundColor = .clear
        tv.register(
            TeamCell.self,
            forCellReuseIdentifier: TeamCell.identifier
        )
        tv.register(
            HeaderView.self,
            forHeaderFooterViewReuseIdentifier: HeaderView.identifier
        )
        tv.backgroundColor = .yellow
        tv.delegate = self
        tv.dataSource = self
        tv.dragDelegate = self
        tv.dragInteractionEnabled = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addPerson)
        )
        
        title = "Favorite teams"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func addPerson() {
        let addVC = AddPersonViewController()
        addVC.cancelWith = { [weak self] team, person in
            self?.dismiss(animated: true)
            guard
                let team = team,
                let person = person,
                let section = self?.teams.firstIndex(where: { teamType in
                    teamType.attributes == team
                })
            else {
                return
            }
            self?.teams[section].persons.insert(person, at: 0)
            self?.tableView.beginUpdates()
            self?.tableView.insertRows(at: [IndexPath(row: 0, section: section)], with: .fade)
            self?.tableView.endUpdates()
            
        }
        let navC = BaseNavigationController(
            rootViewController: addVC
        )
        self.present(navC, animated: true)
    }
}

// MARK: - private methods
private extension TeamsViewController {
    
    func initUI() {
        self.view.addSubview(tableView)
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
}




