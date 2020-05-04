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
    
    var heroDetailControllerMock: HeroDetailControllerMock!
    
    var heroDetailTest: (name: String, description: String, url: String)!
    
    override func setUp() {
        heroDetailPresenter = HeroDetailPresenter()
        heroDetailControllerMock = HeroDetailControllerMock()
        heroDetailPresenter.heroDetailView = heroDetailControllerMock
    }
    
    func testGetHeroDetailWithDescription() {
        
        let hero: Hero = Hero(id: 5, name: "Name", description: "Description", thumbnail: Image(path: "path", ext: "ext"), urls: [HeroDetails(type: "type", url: "Url")])
        heroDetailPresenter.getHeroDetail(hero: hero)
        XCTAssertEqual(heroDetailControllerMock.heroDetail.description, hero.description)
    }
    
    func testGetHeroDetailWithoutDescription() {
        let hero: Hero = Hero(id: 5, name: "Name", description: "", thumbnail: Image(path: "path", ext: "ext"), urls: [HeroDetails(type: "type", url: "Url")])
        heroDetailPresenter.getHeroDetail(hero: hero)
        XCTAssertEqual(heroDetailControllerMock.heroDetail.description, "Doesn't have description")
    }
}
