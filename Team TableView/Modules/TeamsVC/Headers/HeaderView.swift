//
//  MusicHeaderView.swift
//  HW_TableView
//
//  Created by Рамил Гаджиев on 12.03.2022.
//

import UIKit


final class HeaderView: UITableViewHeaderFooterView {
    
    static var identifier: String {
        String(describing: HeaderView.self)
    }
    
    private lazy var title: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    private lazy var teamImg: UIImageView = {
        let img = UIImageView(image: UIImage(named: "unknown"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        initUI()
        initConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        addSubviews(title, teamImg)

        contentView.backgroundColor = .yellow

    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: self.teamImg.leadingAnchor, constant: -16),
            title.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16),
            
            teamImg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            teamImg.heightAnchor.constraint(equalToConstant: 40),
            teamImg.widthAnchor.constraint(equalToConstant: 40),
            teamImg.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
        ])
    }
    
    func configure(with attributes: TeamType) {
        self.title.text = attributes.rawValue
        self.teamImg.image = attributes.logo
    }
}
