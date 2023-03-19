//
//  RocketModel.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import Foundation

//// MARK: - Rocket
//struct Rocket: Decodable {
//    let height, diameter: Diameter?
//    let mass: Mass?
//    let firstStage: FirstStage?
//    let secondStage: SecondStage?
//    let payloadWeights: [PayloadWeight]?
//    let flickrImages: [String]?
//    let name: String?
//    let costPerLaunch: Int?
//    let firstFlight, country: String?
//    let id: String?
//}
//
//// MARK: - Diameter
//struct Diameter: Decodable {
//    let meters, feet: Double?
//}
//
//// MARK: - Engines
//struct Engines: Decodable {
//    let isp: ISP?
//    let thrustSeaLevel, thrustVacuum: Thrust?
//    let number: Int?
//    let type, version: String?
//    let layout: String?
//    let engineLossMax: Int?
//    let propellant1, propellant2: String?
//    let thrustToWeight: Double?
//}
//
//// MARK: - ISP
//struct ISP: Decodable {
//    let seaLevel, vacuum: Int?
//}
//
//// MARK: - Thrust
//struct Thrust: Decodable {
//    let kN, lbf: Int?
//}
//
//// MARK: - FirstStage
//struct FirstStage: Decodable {
//    let thrustSeaLevel, thrustVacuum: Thrust?
//    let reusable: Bool?
//    let engines: Int?
//    let fuelAmountTons: Double?
//    let burnTimeSEC: Int?
//}
//
//// MARK: - LandingLegs
//struct LandingLegs: Decodable {
//    let number: Int?
//    let material: String?
//}
//
//// MARK: - Mass
//struct Mass: Decodable {
//    let kg, lb: Int?
//}
//
//// MARK: - PayloadWeight
//struct PayloadWeight: Decodable {
//    let id, name: String?
//    let kg, lb: Int?
//}
//
//// MARK: - SecondStage
//struct SecondStage: Decodable {
//    let thrust: Thrust?
//    let payloads: Payloads?
//    let reusable: Bool?
//    let engines: Int?
//    let fuelAmountTons: Double?
//    let burnTimeSEC: Int?
//}
//
//// MARK: - Payloads
//struct Payloads: Decodable {
//    let compositeFairing: CompositeFairing?
//    let option1: String?
//}
//
//// MARK: - CompositeFairing
//struct CompositeFairing: Decodable {
//    let height, diameter: Diameter?
//}
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
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

    enum CodingKeys: String, CodingKey {
        case height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name, type, active, stages, boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, company, wikipedia, description, id
    }
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

    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number, type, version, layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

// MARK: - ISP
struct ISP: Decodable {
    let seaLevel, vacuum: Int?

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
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

    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
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

    enum CodingKeys: String, CodingKey {
        case thrust, payloads, reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - Payloads
struct Payloads: Decodable {
    let compositeFairing: CompositeFairing?
    let option1: String?

    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}

// MARK: - CompositeFairing
struct CompositeFairing: Decodable {
    let height, diameter: Diameter?
}

