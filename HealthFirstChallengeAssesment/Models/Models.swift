//
//  People.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

/*
 will create classes wrappers for struct Models
 to be able to cache once I display Data
 */

struct People: Codable {
    let next: URL?
    let previous: URL?
    struct PeopleResult: Codable {
        //requested information : Name,Hair color,Eye color,Birth year,Date created
        let name: String
        let hairColor: String
        let eyeColor: String
        let birthYear: String
        let created: String
        
        // will wrapp in a class
        enum CodingKeys: String, CodingKey {
            case name
            case hairColor = "hair_color"
            case eyeColor = "eye_color"
            case birthYear = "birth_year"
            case created
        }
    }
    let results: [PeopleResult]
}

class Planets: Codable {
    let next: URL?
    let previous: URL?
    class PlanetsResult: Codable {
        // requested information: Name,Climate,Population,Date created
        let name: String
        let climate: String
        let population: String
        let created: String
    }
    let results: [PlanetsResult]
}

//classes

class PeopleHolder: NSObject {
    let people: People.PeopleResult
    
    init(people: People.PeopleResult) {
      self.people = people
    }
}


