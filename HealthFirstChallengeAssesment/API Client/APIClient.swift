//
//  APIClient.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation




final class APIClient {
    //this url retrieve data for STAR WARS PLANETS
    let planetsAPIUrl = "https://swapi.co/api/planets/"
    static func getPeople(completionHandler: @escaping([People.PeopleResult]?, Error?) -> Void) {
        //this url retrieve data for STAR WARS Characters
        guard let url = URL(string: "https://swapi.co/api/people/") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            } else if let data = data {
                do {
                    let people = try JSONDecoder().decode([People.PeopleResult].self, from: data)
                    //got data
                    completionHandler(people,nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
        }.resume()
    }
    
}


 
 
