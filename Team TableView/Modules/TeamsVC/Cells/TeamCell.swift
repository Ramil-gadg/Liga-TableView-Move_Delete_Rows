//
//  MusicCell.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 12.03.2022.
//

import UIKit

final class TeamCell: UITableViewCell {
    
    static var identifier: String {
        String(describing: TeamCell.self)
    }

    
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    private lazy var subTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    private var model: Person?
    
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        
        initUI()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        self.selectionStyle = .none
        self.backgroundColor = .green
        addSubview(title)
        addSubview(subTitle)
    }
    
    private func initConstraints() {
        
        let bottomConstraint = subTitle.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -10)
        bottomConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([

            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            bottomConstraint

        ])
    }
    
    func configure(with model: Person) {
        self.model = model
        
        self.title.text = "Имя игрока: \(model.name)"
        self.subTitle.text = "Кол-во лет: \(String(model.age))"

    }
    

  
}
