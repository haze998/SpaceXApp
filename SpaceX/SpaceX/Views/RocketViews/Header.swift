//
//  Header.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 28.03.2023.
//

import UIKit
import SnapKit

class Header: UICollectionReusableView {
    
    static let id = "Header"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.frame = self.bounds
        return view
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.labGrotesqueBold.rawValue, size: 16)
        label.textColor = .white
        return label
    }()
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.addSubview(containerView)
        containerView.addSubview(headerLabel)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(containerView).inset(16)
        }
    }
}
