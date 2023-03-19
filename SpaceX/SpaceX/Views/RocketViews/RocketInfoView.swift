//
//  RocketInfoView.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 17.03.2023.
//

import SnapKit
import UIKit

class RocketInfoView: UIView {
    var rocketInfo: Rocket!
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
