//
//  HeroViewPresenter.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 27/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol HeroViewPresenterProtocol {
    func loadHeroes(currentPage: Int, isLoading: Bool)
    func onViewLoaded(heroesController: HerosTableViewController)
}

class HeroViewPresenter: HeroViewPresenterProtocol {
    
    var heroesModel: HeroesModel = HeroesModel()
    var heroesController: HerosTableViewController!
    
//    required init(heroesController: HerosTableViewController){
//        self.heroesController = heroesController
//    }
    
    func onViewLoaded(heroesController: HerosTableViewController) {
        self.heroesController = heroesController
    }
    
    func loadHeroes(currentPage: Int, isLoading: Bool) {
        heroesModel.delegate = self
        heroesModel.loadHeroes(currentPage: currentPage, isLoading: isLoading)
    }
}

//MARK: - HeroModelDelegate

extension HeroViewPresenter: HeroModelDelegate {
    func loadHeroModel(heros: [Hero], total: Int) {
        heroesController.loadHeroView(heros: heros, total: total)
    }
}

