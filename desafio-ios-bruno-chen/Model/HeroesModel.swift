//
//  HeroesModel.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 27/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol HeroModelDelegate: class {
    func loadHeroModel(heros: [Hero], total: Int)
}

class HeroesModel {
    
    weak var delegate: HeroModelDelegate?
    
    var marvelDataProvider: DataProviderProtocol?
    
    func loadHeroess(currentPage: Int, isLoading: Bool) {
        
        marvelDataProvider = marvelDataProvider ?? MarvelDataProvider()
        
        marvelDataProvider?.loadData(dataType: K.heroData, int: currentPage, completeData: { (heroesData) in
                if let heroesData = heroesData as? HeroesData {
                let heroes = (heroesData).data.results
                let total = (heroesData).data.total
                DispatchQueue.main.async {
                    //self.isLoading = false
                    self.delegate?.loadHeroModel(heros: heroes, total: total)
                }
            }
        })
    }
}

