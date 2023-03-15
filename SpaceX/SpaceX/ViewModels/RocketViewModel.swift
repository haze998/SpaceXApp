//
//  RocketViewModel.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import Foundation

class RocketViewModel {
    
    // MARK: - List with rockets info
    private(set) var listOfRockets = [Rocket]()

    // MARK: - Fetched rockets info
    func fetchedRockets() {
        RocketNetworkManager.shared.getRocket { rocket in
            self.listOfRockets.append(contentsOf: rocket)
        }
    }
}
