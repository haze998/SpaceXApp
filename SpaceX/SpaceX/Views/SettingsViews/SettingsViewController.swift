//
//  SettingsViewController.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import UIKit

protocol ReloadCollectionView: AnyObject {
    func reloadData()
}

class SettingsViewController: UIViewController {
        
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.labGrotesqueBold.rawValue, size: 16)
        button.titleLabel?.textColor = .white
        return button
    }()
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.labGrotesqueRegular.rawValue, size: 16)
        label.textColor = .white
        label.text = "Settings"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    weak var delegate: ReloadCollectionView?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(views: [closeButton, titleLable, stackView])
        setupUI()
        closeButtonTapped()
        
        Quantity.allCases.forEach { el in
             let settingsView = SettingsView()
            settingsView.configureSettings(with: el)
            stackView.addArrangedSubview(settingsView)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private func closeButtonTapped() {
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }
    
    @objc private func closeButtonAction() {
        dismiss(animated: true)
    }

    private func setupConstraints() {
        closeButton.snp.makeConstraints { make in
            make.width.equalTo(67)
            make.height.equalTo(22)
            make.right.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(18)
        }
        titleLable.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.right.equalTo(closeButton).inset(114)
            make.top.equalToSuperview().inset(18)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLable).inset(78)
            make.width.equalToSuperview()
            make.height.equalTo(312)
        }
        
    }
    
}
