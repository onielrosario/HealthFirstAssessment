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
    let exp = expectation(description: "received data")
    let peopleUrl = "https://swapi.co/api/people/"
    
        
    
    wait(for: [exp], timeout: 3)
    }

}
