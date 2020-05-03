//
//  HeroDetailPresenterTest.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 02/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
@testable import desafio_ios_bruno_chen
import XCTest

class HeroDetailPresenterTest: XCTestCase {
    
    var heroDetailPresenter: HeroDetailPresenter!
    
    var heroDetailTest: (name: String, description: String, url: String)!
    
    override func setUp() {
        heroDetailPresenter = HeroDetailPresenter()
        heroDetailPresenter.delegate = self
    }
    
    func testGetHeroDetailWithDescription() {
        
        let hero: Hero = Hero(id: 5, name: "Name", description: "Description", thumbnail: Image(path: "path", ext: "ext"), urls: [HeroDetails(type: "type", url: "Url")])
        heroDetailPresenter.getHeroDetail(hero: hero)
        XCTAssertEqual(heroDetailTest.description, hero.description)
    }
    
    func testGetHeroDetailWithoutDescription() {
        let hero: Hero = Hero(id: 5, name: "Name", description: "", thumbnail: Image(path: "path", ext: "ext"), urls: [HeroDetails(type: "type", url: "Url")])
        heroDetailPresenter.getHeroDetail(hero: hero)
        XCTAssertEqual(heroDetailTest.description, "Doesn't have description")
    }
    
}

extension HeroDetailPresenterTest: HeroDetailDelegate {
    func loadHeroDetail(heroDetail: (name: String, description: String, url: String)) {
        self.heroDetailTest = (name: heroDetail.name, description: heroDetail.description, url:heroDetail.url)
    }
}
