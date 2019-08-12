//
//  HealthFirstChallengeAssesmentTests.swift
//  HealthFirstChallengeAssesmentTests
//
//  Created by Oniel Rosario on 8/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import XCTest
@testable import HealthFirstChallengeAssesment

class HealthFirstChallengeAssesmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //testing the  STAR WARS APIs
    func testGETpeopleAPI() {
    let exp = expectation(description: "received data for people")
    guard let peopleUrl = URL(string: "https://swapi.co/api/people/") else { return }
        URLSession.shared.dataTask(with: peopleUrl) { (data, response, error) in
            if let error = error {
                XCTFail("\(error)")
            } else if let data = data {
                do {
                    if let _ = try? JSONDecoder().decode(People.self, from: data) {
                        exp.fulfill()
                    }
                }
            }
           
        }.resume()
         wait(for: [exp], timeout: 5.0)
    }
    
    func testGETplanetsAPI() {
        let exp = expectation(description: "received data for planets")
        guard let peopleUrl = URL(string: "https://swapi.co/api/planets/") else { return }
        URLSession.shared.dataTask(with: peopleUrl) { (data, response, error) in
            if let error = error {
                XCTFail("\(error)")
            } else if let data = data {
                do {
                    if let _ = try? JSONDecoder().decode(Planets.self, from: data) {
                        exp.fulfill()
                    }
                }
            }
            
            }.resume()
        wait(for: [exp], timeout: 5.0)
    }
    
    
//    func testGETimagesAPI() {
//       
//        let url = URL(string: "http://intergalacticdb.me/api/characters/name")!
//        let request = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let response = response {
//                print(response)
//                if let data = data, let body = String(data: data, encoding: .utf8) {
//                    print(body)
//                }
//            } else {
//                print(error ?? "Unknown error")
//            }
//        }
//        
//        task.resume()
//    }
}
