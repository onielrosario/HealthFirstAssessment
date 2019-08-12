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
    static func getData(from name: DataCategory, completionHandler: @escaping([People.PeopleResult]?,[Planets.PlanetsResult]?, Error?) -> Void) {
        //this url retrieve data for STAR WARS Characters or Planets depending on the name description
        guard let url = URL(string: "https://swapi.co/api/\(name)/") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(nil,nil, error)
            } else if let data = data {
                do {
                    switch name {
                    case .people:
                         let people = try JSONDecoder().decode(People.self, from: data)
                         completionHandler(people.results,nil,nil)
                    case .planets:
                        let planets = try JSONDecoder().decode(Planets.self, from: data)
                        completionHandler(nil,planets.results,nil)
                    }
                    //got data
                } catch {
                    completionHandler(nil,nil, error)
                }
            }
            }.resume()
    }
    
    /*
     This enpoint retrieve star wars Images.
 */
    //http://intergalacticdb.me/api/characters/name
    
    
}




