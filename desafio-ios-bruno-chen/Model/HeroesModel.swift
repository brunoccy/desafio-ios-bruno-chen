//
//  HeroesModel.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 27/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol HeroModelDelegate {
    func loadHeroModel(heros: [Hero], total: Int)
}

class HeroesModel {
    
    var delegate: HeroModelDelegate?
    
    func loadHeroess(currentPage: Int, isLoading: Bool) {
        MarvelApi.loadAllHeroes(page: currentPage) { (heroesData) in
            if let heroesData = heroesData {
                let heroes = heroesData.data.results
                let total = heroesData.data.total
                DispatchQueue.main.async {
                    //self.isLoading = false
                    self.delegate?.loadHeroModel(heros: heroes, total: total)
                }
            }
        }
    }
}

