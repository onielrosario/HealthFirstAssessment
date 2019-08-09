//
//  People.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

/*
 will create classes instead of struct
 to be able to cache once I display Data
 */

class People: Codable {
    let next: URL?
    let previous: URL?
    class PeopleResult: Codable {
        // people requested information : Name,Hair color,Eye color,Birth year,Date created
        let name: String
        let hair_color: String
        let eye_color: String
        let birth_year: String
        let created: String
    }
    let results: [PeopleResult]
}


class Planets: Codable {
    let next: URL?
    let previous: URL?
    class PlanetsResult: Codable {
        // planet requested information: Name,Climate,Population,Date created
        let name: String
        let climate: String
        let population: String
        let created: String
    }
    let results: [PlanetsResult]
}
