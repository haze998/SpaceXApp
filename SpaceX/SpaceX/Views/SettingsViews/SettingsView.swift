//
//  SettingsView.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 21.03.2023.
//

import UIKit
import SnapKit

class SettingsView: UIView {
    
    private let defaults = UserDefaults.standard
    private var quantity: Quantity?

    private lazy var customSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["2", "3"])
        segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentControl.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        segmentControl.selectedSegmentTintColor = .white
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.557, green: 0.557, blue: 0.561, alpha: 1), NSAttributedString.Key.font: UIFont(name: FontNames.sfProText.rawValue, size: 14) ?? ""], for: .normal)
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1), NSAttributedString.Key.font: UIFont(name: FontNames.sfProText.rawValue, size: 14) ?? ""], for: .selected)
        return segmentControl
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        label.font = UIFont(name: FontNames.labGrotesqueRegular.rawValue, size: 16)
        return label
    }()
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    @objc private func segmentChanged() {
        UserDefaults.standard.setValue(customSegmentControl.selectedSegmentIndex, forKey: quantity?.rawValue ?? "")
    }
    
    func configureSettings(with value: Quantity) {
        titleLabel.text = value.rawValue
        self.quantity = value
        customSegmentControl.selectedSegmentIndex = defaults.integer(forKey: value.rawValue)
        customSegmentControl.setTitle(value.measures[0], forSegmentAt: 0)
        customSegmentControl.setTitle(value.measures[1], forSegmentAt: 1)
    }
    
    private func setupConstraints() {
        self.addSubviews(views: [customSegmentControl, titleLabel])
        
        customSegmentControl.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(28)
            make.height.equalTo(40)
            make.width.equalTo(115)
            make.top.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(28)
            make.height.equalTo(24)
            make.width.equalTo(176)
            make.right.equalTo(customSegmentControl).inset(28)
            make.centerY.equalTo(customSegmentControl)
        }
    }
}


