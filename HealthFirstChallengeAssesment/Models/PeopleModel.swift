//
//  PeopleModel.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/12/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation


public struct People: Codable {
    var next: String?
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
