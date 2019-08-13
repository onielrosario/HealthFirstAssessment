//
//  APIClient.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

//enum cases will alter the url enpoint

enum DataCategory: String {
    case people = "people"
    case planets = "planets"
}




final class APIClient {
    static func getData(from name: DataCategory,page: Int, completionHandler: @escaping(People?,Planets?, Error?) -> Void) {
        guard let url = URL(string: "https://swapi.co/api/\(name)/?page=\(page)") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(nil,nil, error)
            } else if let data = data {
                do {
                    switch name {
                    case .people:
                         let people = try JSONDecoder().decode(People.self, from: data)
                         completionHandler(people,nil,nil)
                    case .planets:
                        let planets = try JSONDecoder().decode(Planets.self, from: data)
                        completionHandler(nil,planets,nil)
                    }
                } catch {
                    completionHandler(nil,nil, error)
                }
            }
            }.resume()
    }
    
    /*
     This enpoint retrieve star wars Images.
     for future implementations
 */
    //http://intergalacticdb.me/api/characters/name
    
    
}




