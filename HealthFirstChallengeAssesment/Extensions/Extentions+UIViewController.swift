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
        let ok = UIAlertAction(title: title, style: .default) { (OK) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
