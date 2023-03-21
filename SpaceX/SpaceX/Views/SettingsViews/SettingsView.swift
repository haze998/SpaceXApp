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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var customSegmentControl: UISegmentedControl = {
        //let segmentControlItems = ["", ""]
        let segmentControl = UISegmentedControl(items: ["", ""])
        segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentControl.backgroundColor = .init(red: 33, green: 33, blue: 33, alpha: 1)
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
    
    @objc private func segmentChanged() {
        defaults.set(customSegmentControl.selectedSegmentIndex, forKey: <#T##String#>)
        defaults.synchronize()
    }
}


