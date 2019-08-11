//
//  PeopleTableCell.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class PeopleTableCell: UITableViewCell {
    @IBOutlet weak var CharacterNameLabel: UILabel!
    
    func configureCell(name: String) {
        CharacterNameLabel.text = name
    }
}
