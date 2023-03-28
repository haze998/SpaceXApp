//
//  RocketWikiCollectionViewCell.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 27.03.2023.
//

import UIKit
import SnapKit

class RocketWikiCollectionViewCell: UICollectionViewCell {
    
    static let id = "RocketWikiCollectionViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.frame = contentView.bounds
        return view
    }()
    
    private lazy var leadingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.labGrotesqueRegular.rawValue, size: 16)
        label.textColor = UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1)
        return label
    }()
    
    private lazy var trailingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.labGrotesqueRegular.rawValue, size: 16)
        label.textColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        return label
    }()
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    public func configureCell(with rocket: Rocket, indexPath: IndexPath) {
        switch indexPath.item {
        case 0: trailingLabel.text = rocket.firstFlight?.formattedDate(withFormat: "dd MMM, yyyy")
            leadingLabel.text = WikiInfo.firstLaunch.rawValue
        case 1:trailingLabel.text = rocket.country
            leadingLabel.text = WikiInfo.country.rawValue
        case 2:
            trailingLabel.text = "$\(Double(rocket.costPerLaunch ?? 0)) mln"
            leadingLabel.text = WikiInfo.launchCost.rawValue
        default: break
        }
    }
    
    private func setupConstraints() {
        
        contentView.addSubviews(views: [containerView])
        containerView.addSubviews(views: [leadingLabel, trailingLabel])
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        leadingLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView).inset(0)
            make.left.equalTo(containerView).inset(16)
        }
        
        trailingLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView).inset(0)
            make.right.equalTo(containerView).inset(16)
        }
    }
}
