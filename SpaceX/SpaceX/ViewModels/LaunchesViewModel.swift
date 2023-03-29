//
//  LaunchesViewModel.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import Foundation

class LaunchesViewModel {
    
    // MARK: - List with launches info
    private(set) var listOfLaunches = [Launches]()
    
    // MARK: - Fetched launches info
    func fetchedLaunches(complition: @escaping () -> Void) {
        LaunchesNetworkManager.shared.getLaunches { launches in
            self.listOfLaunches.append(contentsOf: launches)
            complition()
        }
    }
}
