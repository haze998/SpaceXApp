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
            make.top.right.bottom.left.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.bottom.right.equalTo(containerView)
            make.left.equalTo(containerView).inset(16)
        }
    }
}
