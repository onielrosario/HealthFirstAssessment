//
//  Extentions.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func presentDetail(image: String, character: People.PeopleResult?, planet: Planets.PlanetsResult?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
            detailVC.imageName = image
            detailVC.character = character
            detailVC.planet = planet
            detailVC.modalTransitionStyle = .crossDissolve
            detailVC.modalPresentationStyle = .overCurrentContext
            present(detailVC, animated: true)
        }
    }
    
    public func presentAlertWithAction(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { OK in }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
