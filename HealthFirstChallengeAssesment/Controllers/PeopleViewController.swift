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
    var currentPage = 1
    var isFetching = false
    
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
        APIClient.getData(from: DataCategory.people, page: currentPage, completionHandler: { [weak self](characters, nil, error) in
            if let error = error {
               self?.presentAlertWithAction(title: "Error", message: error.localizedDescription)
            } else if let characters = characters {
                self?.starWarsCharacters = characters
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
        let character = starWarsCharacters[indexPath.row]
        presentDetail(image: "CharacterBackgoundImage", character: character, planet: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height {
            if !isFetching {
                isFetching = true
                // make more API calls
            fetchMoreData()
            }
        }
    }
    
    private func fetchMoreData() {
        currentPage += 1
        isFetching = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            APIClient.getData(from: DataCategory.people, page: self.currentPage, completionHandler: { (people, nil, error) in
                if let error = error {
                    self.presentAlertWithAction(title: nil, message: error.localizedDescription)
                } else if let people = people {
                    self.starWarsCharacters.append(contentsOf: people)
                    self.isFetching = false
                }
            })
        }
    }
}
