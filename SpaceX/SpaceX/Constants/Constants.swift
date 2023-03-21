//
//  Constants.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 19.03.2023.
//

import Foundation

enum FontNames: String {
    case labGrotesqueMedium = "LabGrotesque-Medium"
    case labGrotesqueBold = "LabGrotesque-Bold"
    case labGrotesqueRegular = "LabGrotesque-Regular"
    case sfProText = "SFProText-Semibold"
}

enum Quantity: String {
    case Height
    case Diameter
    case Weight
    case Payload
    
    var measures: [String] {
        switch self {
        case .Height:
            return ["m", "ft"]
        case .Diameter:
            return ["m", "ft"]
        case .Weight:
            return ["kg", "lb"]
        case .Payload:
            return ["kg", "lb"]
        }
    }
}
