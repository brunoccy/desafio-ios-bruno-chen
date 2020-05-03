//
//  HerosTableViewController.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 24/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import UIKit

class HerosTableViewController: UITableViewController {
    
    var currentPage = 0
    var heroes: [Hero] = []
    var isLoading: Bool = false
    var total = 0
    
    var herosViewPresenter: HeroViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        herosViewPresenter = herosViewPresenter ?? HeroViewPresenter()
        herosViewPresenter.onViewLoaded(heroesController: self)
//      herosViewPresenter = HeroViewPresenter(heroesController: self)
        herosViewPresenter.loadHeroes(currentPage: currentPage, isLoading: isLoading)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let target = segue.destination as! HeroDetailViewController
        target.hero = heroes[tableView.indexPathForSelectedRow!.row]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "heroDetailSegue", sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! HerosTableViewCell
        let hero = heroes[indexPath.row]
        cell.loadCell(with: hero)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 10 && !isLoading && heroes.count != total {
            currentPage += 1
            herosViewPresenter.loadHeroes(currentPage: currentPage, isLoading: isLoading)
        }
    }
    
    func loadHeroView(heros: [Hero], total: Int) {
        self.heroes += heros
        self.total = total
        isLoading = false
        tableView.reloadData()
    }
}

