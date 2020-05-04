//
//  HeroDetailPresenter.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 27/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol HeroDetailPresenterProtocol {
    func onViewLoaded(heroDetailView: HeroDetailViewController)
    func getHeroDetail(hero: Hero)
}

class HeroDetailPresenter: HeroDetailPresenterProtocol {

    var heroDetailView: HeroDetailViewControllerProtocol!
    
    func onViewLoaded(heroDetailView: HeroDetailViewController) {
        self.heroDetailView = heroDetailView
    }
    
    func getHeroDetail(hero: Hero) {
        var heroDetail: (name: String, description: String, url: String)
        heroDetail.name = hero.name
        if hero.description != "" {
            heroDetail.description = hero.description
        } else {
            heroDetail.description = "Doesn't have description"
        }
        heroDetail.url = hero.thumbnail.url
        heroDetailView.loadHeroDetail(heroDetail: heroDetail)
    }
}
