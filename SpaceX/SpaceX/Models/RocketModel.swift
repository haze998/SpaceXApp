//
//  RocketModel.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import Foundation

// MARK: - Rocket
struct Rocket: Decodable {
    let height, diameter: Diameter?
    let mass: Mass?
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let engines: Engines?
    let landingLegs: LandingLegs?
    let payloadWeights: [PayloadWeight]?
    let flickrImages: [String]?
    let name, type: String?
    let active: Bool?
    let stages, boosters, costPerLaunch, successRatePct: Int?
    let firstFlight, country, company: String?
    let wikipedia: String?
    let description, id: String?
}

// MARK: - Diameter
struct Diameter: Decodable {
    let meters, feet: Double?
}

// MARK: - Engines
struct Engines: Decodable {
    let isp: ISP?
    let thrustSeaLevel, thrustVacuum: Thrust?
    let number: Int?
    let type, version: String?
    let layout: String?
    let engineLossMax: Int?
    let propellant1, propellant2: String?
    let thrustToWeight: Double?
}

// MARK: - ISP
struct ISP: Decodable {
    let seaLevel, vacuum: Int?
}

// MARK: - Thrust
struct Thrust: Decodable {
    let kN, lbf: Int?
}

// MARK: - FirstStage
struct FirstStage: Decodable {
    let thrustSeaLevel, thrustVacuum: Thrust?
    let reusable: Bool?
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSEC: Int?
}

// MARK: - LandingLegs
struct LandingLegs: Decodable {
    let number: Int?
    let material: String?
}

// MARK: - Mass
struct Mass: Decodable {
    let kg, lb: Int?
}

// MARK: - PayloadWeight
struct PayloadWeight: Decodable {
    let id, name: String?
    let kg, lb: Int?
}

// MARK: - SecondStage
struct SecondStage: Decodable {
    let thrust: Thrust?
    let payloads: Payloads?
    let reusable: Bool?
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSEC: Int?
}

// MARK: - Payloads
struct Payloads: Decodable {
    let compositeFairing: CompositeFairing?
    let option1: String?
}

// MARK: - CompositeFairing
struct CompositeFairing: Decodable {
    let height, diameter: Diameter?
}

