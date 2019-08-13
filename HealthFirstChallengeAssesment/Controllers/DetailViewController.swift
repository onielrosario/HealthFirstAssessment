//
//  DetailViewController.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var detailBackground: UIImageView!
    var imageName: String?
    var character: People.PeopleResult?
    var planet: Planets.PlanetsResult?
    @IBOutlet weak var mainNameLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    
    private func setupUI() {
          let labels: [UILabel] = [firstLabel,secondLabel,thirdLabel,fourthLabel]
         labels.forEach{$0.textColor = .white}
        if let image = imageName {
              detailBackground.image = UIImage(named: image)
        }
        if let character = character {
            mainNameLabel.textColor = .white
        updateLabels(character: character, planet: nil)
        } else if let planet = planet  {
             mainNameLabel.textColor = .black
          updateLabels(character: nil, planet: planet)
        }
    }
    
    private func updateLabels(character: People.PeopleResult?, planet: Planets.PlanetsResult?) {
        if let character = character {
            mainNameLabel.text = character.name
            firstLabel.text = "Hair color: \n\(character.hairColor)"
            secondLabel.text = "Eye color: \n\(character.eyeColor)"
            thirdLabel.text = "birth: \n\(character.birthYear)"
            fourthLabel.text = "Date created: \n\(character.created.returnDateFormatted(dateToFormat: "MM/dd/yyyy"))"
        } else if let planet = planet {
            mainNameLabel.text = planet.name
            firstLabel.text = "climate: \n\(planet.climate)"
            secondLabel.text = "population: \n\(planet.population)"
            thirdLabel.text = "created: \n\(planet.created.returnDateFormatted(dateToFormat: "MM/dd/yyyy"))"
            fourthLabel.isHidden = true
        }
    }
    
    deinit {
        imageName = nil
        planet = nil
        character = nil
    }

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

