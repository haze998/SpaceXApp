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

enum Quantity: String, CaseIterable {
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

enum WikiInfo: String {
    case firstLaunch = "First launch"
    case country = "Country"
    case launchCost = "Launch cost"
}

enum FirstStageInfo: String {
    case header = "FIRST STAGE"
    case numberOfEngines = "Number of engines"
    case fuelQuantity = "Fuel quantity"
    case combustionTime = "Combustion time"
}

enum SecondStageInfo: String {
    case header = "SECOND STAGE"
    case numberOfEngines = "Number of engines"
    case fuelQuantity = "Fuel quantity"
    case combustionTime = "Combustion time"
}
