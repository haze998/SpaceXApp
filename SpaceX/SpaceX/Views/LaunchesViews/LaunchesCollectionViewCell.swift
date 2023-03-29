//
//  LaunchesCollectionViewCell.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 29.03.2023.
//

import UIKit
import SnapKit

class LaunchesCollectionViewCell: UICollectionViewCell {
    
    static let id = "LaunchesCollectionViewCell"
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.frame = contentView.bounds
        view.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        view.layer.cornerRadius = 24
        return view
    }()
    
    private lazy var rocketNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont(name: FontNames.labGrotesqueRegular.rawValue, size: 20)
        return label
    }()
    
    private lazy var launchDateLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.561, alpha: 1)
        label.font = UIFont(name: FontNames.labGrotesqueRegular.rawValue, size: 16)
        return label
    }()
    
    private lazy var rocketStatusImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        return image
    }()
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    public func configureCell(with launch: Launches) {
        rocketNameLabel.text = launch.name
        let dateString = launch.date_local ?? ""
        let isoDateFormatter = ISO8601DateFormatter()
        let date = isoDateFormatter.date(from: dateString)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        let dateStringFormatted = dateFormatter.string(from: date!)
        
        launchDateLabel.text = dateStringFormatted
        
        switch launch.success {
        case true: rocketStatusImage.image = UIImage(named: "rocketSuccess")
        default: rocketStatusImage.image = UIImage(named: "rocketFailure")
        }
    }
    
    private func setupConstraints() {
        contentView.addSubview(containerView)
        containerView.addSubviews(views: [rocketNameLabel, launchDateLabel, rocketStatusImage])
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        rocketNameLabel.snp.makeConstraints { make in
            make.left.equalTo(containerView).inset(26)
            make.top.equalTo(containerView).inset(26)
            make.width.equalTo(150)
        }
        
        launchDateLabel.snp.makeConstraints { make in
            make.left.equalTo(containerView).inset(26)
            make.bottom.equalTo(containerView).inset(26)
            make.width.equalTo(400)
        }
        
        rocketStatusImage.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(32)
            make.centerY.equalTo(containerView)
            make.right.equalTo(containerView).inset(32)
        }
    }
}
