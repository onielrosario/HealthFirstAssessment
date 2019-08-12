//
//  PlanetsViewController.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/10/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class PlanetsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var planets = [Planets.PlanetsResult]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        getPlanets()
    }
    
    private func getPlanets() {
        APIClient.getData(from: DataCategory.planets) { [weak self] (nil, planets, error) in
            if let error = error {
                self?.presentAlertWithAction(title: "Error", message: error.localizedDescription)
            } else if let planets = planets {
                self?.planets = planets
            }
        }
    }
}

extension PlanetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as? PlanetTableCell else {
            fatalError("error on cell dequeue")
        }
        let planet = planets[indexPath.row]
        cell.configureCell(name: planet.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //navigate to see Detailed information
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let planet = planets[indexPath.row]
        presentDetail(image: "11832", character: nil, planet: planet)
    }
}
