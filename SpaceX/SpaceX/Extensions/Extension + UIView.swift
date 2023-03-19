//
//  Extension + UIView.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 19.03.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
