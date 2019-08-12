//
//  People.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

/*
 structs Models for the API objects
 */

public struct People: Codable {
    struct PeopleResult: Codable {
        //requested information : Name,Hair color,Eye color,Birth year,Date created
        let name: String
        let hairColor: String
        let eyeColor: String
        let birthYear: String
        let created: String
        
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

public class Planets: Codable {
    class PlanetsResult: Codable {
        // requested information: Name,Climate,Population,Date created
        let name: String
        let climate: String
        let population: String
        let created: String
    }
    let results: [PlanetsResult]
}


