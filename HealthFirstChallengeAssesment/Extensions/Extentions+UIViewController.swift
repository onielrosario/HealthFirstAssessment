//
//  Extentions.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

// dynamically set the background of detail View Controller
extension UIViewController {
    func presentDetail(image: String, character: People.PeopleResult?, planet: Planets.PlanetsResult?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let DetailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
            DetailVC.imageName = image
            DetailVC.character = character
            DetailVC.planet = planet
            present(DetailVC, animated: true)
        }
    }
    
    public func presentAlertWithAction(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { OK in }
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    
     func fetchMoreCharacters(page: Int) -> [People.PeopleResult] {
        var newCharacters = [People.PeopleResult]()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                APIClient.getData(from: DataCategory.people, page: page, completionHandler: { (people, nil, error) in
                    if let error = error {
                        self.presentAlertWithAction(title: nil, message: error.localizedDescription)
                    } else if let people = people {
                       newCharacters = people
                    }
                })
            }
        return newCharacters
        }
}
