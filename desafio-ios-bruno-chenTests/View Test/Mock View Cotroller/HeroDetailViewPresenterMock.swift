//
//  HeroDetailViewPresenterTest.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 04/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
@testable import desafio_ios_bruno_chen

class HeroDetailViewPresenterMock: HeroDetailPresenterProtocol {

    var onViewLoadCalled = false
    
    var hero = Hero(id: 0, name: "", description: "", thumbnail: Image(path: "", ext: ""), urls: [HeroDetails(type: "", url: "")])
    var a = 2
    
    func onViewLoaded(heroDetailView: HeroDetailViewController) {
        onViewLoadCalled = true
    }
    
    func getHeroDetail(hero: Hero) {
        self.hero = hero
    }
}
