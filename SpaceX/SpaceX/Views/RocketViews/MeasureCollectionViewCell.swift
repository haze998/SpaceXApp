//
//  MeasureCollectionViewCell.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 22.03.2023.
//

import UIKit
import SnapKit

class MeasureCollectionViewCell: UICollectionViewCell {
    
    static let id = "MeasureCollectionViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.frame = contentView.bounds
        view.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        view.layer.cornerRadius = 32
        return view
    }()
    
    lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: FontNames.labGrotesqueBold.rawValue, size: 16)
        return label
    }()
    
    private lazy var measureLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.561, alpha: 1)
        label.font = UIFont(name: FontNames.labGrotesqueRegular.rawValue, size: 14)
        return label
    }()
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    public func configureCell(with rocket: Rocket, quantity: Quantity, indexPath: IndexPath) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let rocketMassKg = rocket.mass?.kg ?? 0
        let rocketMassLb = rocket.mass?.lb ?? 0
        let payloadKg = rocket.payloadWeights?[0].kg ?? 0
        let payloadLb = rocket.payloadWeights?[0].lb ?? 0
        
        let formattedMassKg = numberFormatter.string(from: NSNumber(value: rocketMassKg))
        let formattedMassLb = numberFormatter.string(from: NSNumber(value: rocketMassLb))
        let formattedPayloadKg = numberFormatter.string(from: NSNumber(value: payloadKg))
        let formattedPayloadLb = numberFormatter.string(from: NSNumber(value: payloadLb))
        
        let defaultsStorage = UserDefaults.standard.integer(forKey: quantity.rawValue)
        measureLabel.text = "\(quantity.rawValue)" + ", " + "\(quantity.measures[defaultsStorage])"
        switch indexPath.item {
        case 0:
            defaultsStorage == 0 ? (counterLabel.text = "\(rocket.height?.meters ?? 0)") : (counterLabel.text = "\(rocket.height?.feet ?? 0)")
        case 1:
            defaultsStorage == 0 ? (counterLabel.text = "\(rocket.diameter?.meters ?? 0)") : (counterLabel.text = "\(rocket.diameter?.feet ?? 0)")
        case 2:
            defaultsStorage == 0 ? (counterLabel.text = "\(formattedMassKg ?? "")") : (counterLabel.text = "\(formattedMassLb ?? "")")
        case 3:
            defaultsStorage == 0 ? (counterLabel.text = "\(formattedPayloadKg ?? "")") : (counterLabel.text = "\(formattedPayloadLb ?? "")")
        default: break
        }
    }
    
    private func setupConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubviews(views: [counterLabel, measureLabel])
        
        containerView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(contentView)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(30)
        }
        
        measureLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(counterLabel).inset(30)
        }
    }
}
