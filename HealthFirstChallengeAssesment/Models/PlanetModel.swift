//
//  PlanetModel.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/12/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation


public class Planets: Codable {
    var next: String?
    class PlanetsResult: Codable {
        // requested information: Name,Climate,Population,Date created
        let name: String
        let climate: String
        let population: String
        let created: String
    }
    let results: [PlanetsResult]
}
