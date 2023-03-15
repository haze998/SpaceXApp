//
//  LaunchesNetworkManager.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import Foundation
import Alamofire

class LaunchesNetworkManager {
    
    static let shared = LaunchesNetworkManager()
    
    private init() { }
    
    // MARK: - Get request about launches info
    func getLaunches(completion: @escaping ([Launches]) -> Void) {
        let request = AF.request("https://api.spacexdata.com/v4/launches", method: .get)
        request.responseDecodable(of: [Launches].self) { response in
            do {
                let result = try response.result.get()
                completion(result)
            } catch {
                print("error: \(error)")
            }
        }
    }
}
