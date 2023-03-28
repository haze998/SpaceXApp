//
//  SecondStageCollectionViewCell.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 28.03.2023.
//

import UIKit
import SnapKit

class SecondStageCollectionViewCell: UICollectionViewCell {
    
    static let id = "SecondStageCollectionViewCell"
    
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
        
        switch indexPath.row {
        case 0: trailingLabel.text = (String(describing: rocket.secondStage?.engines ?? 0))
            leadingLabel.text = SecondStageInfo.numberOfEngines.rawValue
        case 1: trailingLabel.text = "\(String(describing: rocket.secondStage?.fuelAmountTons ?? 0)) ton"
            leadingLabel.text = SecondStageInfo.fuelQuantity.rawValue
        case 2: trailingLabel.text = "\(String(describing: rocket.secondStage?.burnTimeSEC ?? 0)) sec"
            leadingLabel.text = SecondStageInfo.combustionTime.rawValue
        default: return
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
