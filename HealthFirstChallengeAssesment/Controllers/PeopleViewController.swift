//
//  ViewController.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var starWarsCharacters = [People.PeopleResult]() {
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
        getChatacters()
    }
    
    private func getChatacters() {
        APIClient.getData(from: DataCategory.people, completionHandler: { (characters, nil, error) in
            if let error = error {
                print(error)
            } else if let characters = characters {
                self.starWarsCharacters = characters
            }
        })
    }
    
}

extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath) as? PeopleTableCell else {
            fatalError("error dequeuing table cell")
        }
        let character = starWarsCharacters[indexPath.row]
        cell.configureCell(name: character.name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //navigate to see detailed information
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PresentDetail(image: "CharacterBackgoundImage")
    }
}
