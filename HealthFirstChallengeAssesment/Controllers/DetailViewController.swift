//
//  DetailViewController.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var DetailBackground: UIImageView!
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let image = imageName {
              DetailBackground.image = UIImage(named: image)
        }
    }
    
    deinit {
        imageName = nil
    }

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
