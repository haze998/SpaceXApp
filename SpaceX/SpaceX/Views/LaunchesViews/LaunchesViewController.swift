//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import UIKit
import SnapKit

class LaunchesViewController: UIViewController {

    private lazy var lable: UILabel = {
        let label = UILabel()
        label.text = "Launches"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(lable)
        lable.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

}
