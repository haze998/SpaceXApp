//
//  LaunchesViewModel.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import Foundation

class LaunchesViewModel {
    
    // MARK: - List with launches info
    private(set) var listOfLaunches: [Launches] = [] {
        didSet {
            listOfLaunches = listOfLaunches.sorted(by: { $0.date_local ?? "" > $1.date_local ?? "" })
        }
    }
    
    // MARK: - Fetched launches info
    func fetchedLaunches(complition: @escaping () -> Void) {
        LaunchesNetworkManager.shared.getLaunches { launches in
            self.listOfLaunches.append(contentsOf: launches)
            complition()
        }
    }
}
