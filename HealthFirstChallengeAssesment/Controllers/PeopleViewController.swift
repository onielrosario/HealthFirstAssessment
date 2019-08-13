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
    private var currentPeoplePage: String!
    private var currentPage = 1
    private var isFetching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        getChatacters()
    }
    
    private func getChatacters() {
        APIClient.getData(from: DataCategory.people, page: currentPage, completionHandler: { [weak self](characters, nil, error) in
            if let error = error {
                self?.presentAlertWithAction(title: "Error", message: error.localizedDescription)
            } else if let characters = characters {
                self?.currentPeoplePage = characters.next
                self?.starWarsCharacters = characters.results
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
        //cache data to minimize calls
        let cache = NSCache<NSString, NSString>()
        if let cachedData = cache.object(forKey: "cachedData") as String? {
            cell.configureCell(name: cachedData)
        } else {
            cell.configureCell(name: character.name)
        }
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
                fetchMoreData()
            }
        }
    }
    
    private func fetchMoreData() {
        guard currentPeoplePage != nil else { return }
        currentPage += 1
        isFetching = !isFetching
            APIClient.getData(from: DataCategory.people, page: self.currentPage, completionHandler: { (people, nil, error) in
                if error != nil {
                    return
                } else if let people = people {
                    self.starWarsCharacters.append(contentsOf: people.results)
                    self.isFetching = !self.isFetching
                }
            })
    }
}
