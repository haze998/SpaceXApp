//
//  RocketNetworkManager.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 15.03.2023.
//

import Foundation
import Alamofire

class RocketNetworkManager {
    
    static let shared = RocketNetworkManager()
    
    private init() { }
    
    // MARK: - Get request about rockets info
    func getRocket(completion: @escaping ([Rocket]) -> Void) {
        let request = AF.request("https://api.spacexdata.com/v4/rockets", method: .get)
        request.responseDecodable(of: [Rocket].self) { response in
            do {
                let result = try response.result.get()
                completion(result)
            } catch {
                print("Error: \(error)")
            }
        }
    }    
}
