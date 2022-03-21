//
//  AddPersonViewController.swift
//  Team TableView
//
//  Created by Рамил Гаджиев on 20.03.2022.
//

import UIKit

class AddPersonViewController: UIViewController, KeyboardNotifications {
    
    var cancelWith: ((TeamType?, Person?) -> Void)?
    var type: TeamType?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 50
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var ageStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalCentering
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var teamImg: UIImageView = {
        let img = UIImageView(image: UIImage(named: "unknown"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let items = TeamType.allCases.map { $0.shortName }
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentTintColor = .lightGray
        sc.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        sc.tintColor = .gray
        sc.backgroundColor = .systemCyan
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    private lazy var nameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Имя игрока"
        tf.layer.cornerRadius = 16
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var ageStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 18
        stepper.maximumValue = 45
        stepper.addTarget(
            self,
            action: #selector(stepperValueChanged(_:)),
            for: .valueChanged
        )
        stepper.wraps = false
        return stepper
    }()
    
    private lazy var ageLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return lbl
    }()
    
    private lazy var nextBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Добавить", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.addTarget(
            self,
            action: #selector(addBtnTapped),
            for: .touchUpInside
        )
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Добавить игрока"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(cancelVC)
        )
        navigationItem.largeTitleDisplayMode = .never
        
        initUI()
        initConstraints()
    }
    
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            teamImg.image = TeamType.barsa.logo
            type = TeamType.barsa
        case 1:
            teamImg.image = TeamType.real.logo
            type = TeamType.real
        case 2:
            teamImg.image = TeamType.cska.logo
            type = TeamType.cska
        case 3:
            teamImg.image = TeamType.bavaria.logo
            type = TeamType.bavaria
        default:
            break
        }
    }
    
    @objc func stepperValueChanged(_ sender:UIStepper!) {
        ageLbl.text = "Количество лет: \(Int(ageStepper.value))"
    }
    
    @objc func cancelVC() {
        cancelWith?(nil, nil)
    }
    
    @objc func addBtnTapped() {
        if let text = nameTF.text,
           !text.isEmpty,
           let team = type {
            cancelWith?(team, Person(name: text, age: Int(ageStepper.value)))
        } else {
            let alert = UIAlertController(
                title: "Заполните данные",
                message: "Для добавления игрока необходимо заполнить все данные",
                preferredStyle: .alert
            )
            let ok = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
    
    func keyboardWillChange(height: CGFloat) {
        let margin: CGFloat = height == 0 ? 0 : height + 64
        scrollView.contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: margin,
            right: 0
        )
    }
}

// MARK: - private methods
private extension AddPersonViewController {
    
    func initUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        self.hideKeyboardWhenTappedAround()
        registerForKeyboardNotifications()
        ageStack.addArrangedSubviews(ageStepper, ageLbl)
        stackView.addArrangedSubviews(
            teamImg,
            segmentedControl,
            nameTF,
            ageStack,
            nextBtn
        )
        ageLbl.text = "Количество лет: \(Int(ageStepper.value))"
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            
            ageStack.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            teamImg.heightAnchor.constraint(equalToConstant: 100),
            nameTF.heightAnchor.constraint(equalToConstant: 50),
            segmentedControl.heightAnchor.constraint(equalToConstant: 32),
            nextBtn.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
