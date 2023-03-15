//
//  LaunchesModel.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import Foundation

// MARK: - WelcomeElement

struct Launches: Decodable {
    let id: String?
    let success: Bool?
    let name: String?
    let rocket: String?
    let date_local: String?
    let net: Bool?
}

