//
//  HeroDetailControllerMock.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 04/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
@testable import desafio_ios_bruno_chen

class HeroDetailControllerMock: HeroDetailViewControllerProtocol {
    
    var heroDetail = (name: "", description: "", url: "")
    
    func loadHeroDetail(heroDetail: (name: String, description: String, url: String)) {
        self.heroDetail = heroDetail
    }
    
    
}
