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
    
    // MARK: - List of rockets launches
    private(set) var listOfLaunches: [Launches] = []
    
    // MARK: - Get request about rockets info
    func getRocket(with index: Int, completion: @escaping (Rocket) -> Void) {
        let request = AF.request("https://api.spacexdata.com/v4/rockets", method: .get)
        request.responseDecodable(of: [Rocket].self) { response in
            do {
                let data = try response.result.get()
                completion(data[index])
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    // MARK: - Get request about launches info
    func getLaunches(with identifier: String, completion: @escaping ([Launches]) -> Void) {
        let request = AF.request("https://api.spacexdata.com/v4/launches", method: .get)
        request.responseDecodable(of: [Launches].self) { response in
            do {
                let data = try response.result.get()
                self.listOfLaunches = data.filter({ rocketId in
                    rocketId.id == "id"
                })
                completion(self.listOfLaunches)
            } catch {
                print("error: \(error)")
            }
        }
    }
}
