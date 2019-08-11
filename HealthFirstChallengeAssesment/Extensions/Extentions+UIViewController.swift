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
    func PresentDetail(image: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let DetailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
            DetailVC.imageName = image
            present(DetailVC, animated: true)
        }
    }
}
