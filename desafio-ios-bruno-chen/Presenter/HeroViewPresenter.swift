//
//  HeroViewPresenter.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 27/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

class HeroViewPresenter {
    
    var heroesModel: HeroesModel = HeroesModel()
    var heroesController: HerosTableViewController
    
    required init(heroesController: HerosTableViewController){
        self.heroesController = heroesController
    }
    
    func loadHeroes(currentPage: Int, isLoading: Bool) {
        heroesModel.delegate = self
        heroesModel.loadHeroess(currentPage: currentPage, isLoading: isLoading)
    }
}

//MARK: - HeroModelDelegate

extension HeroViewPresenter: HeroModelDelegate {
    func loadHeroModel(heros: [Hero], total: Int) {
        heroesController.loadHeroView(heros: heros, total: total)
    }
}

