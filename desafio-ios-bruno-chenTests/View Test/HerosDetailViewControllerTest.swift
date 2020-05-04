//
//  HerosDetailViewControllerTest.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 04/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
@testable import desafio_ios_bruno_chen
import XCTest
import Nimble

class HerosDetailViewControllerTest: XCTestCase {

    var presenter: HeroDetailViewPresenterMock!
    var heroDetailViewController: HeroDetailViewController!

    override func setUp() {
        presenter = HeroDetailViewPresenterMock()
        
        let hero = Hero(id: 10, name: "Spider-Man", description: "Red", thumbnail: Image(path: "spider-man-path", ext: "jpg"), urls: [HeroDetails(type: "heroModel", url: "www.marvel.com")])
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        heroDetailViewController = storyboard.instantiateViewController(identifier: "HeroDetailController")
        heroDetailViewController.heroDetailPresenter = presenter
        heroDetailViewController.hero = hero
        heroDetailViewController.loadViewIfNeeded()
        heroDetailViewController.viewDidLoad()
    }

    func testViewDidLoadCallsPresenter() {
        expect(self.presenter.onViewLoadCalled) == true
    }

    func testCallGetHeroDetailPresenter() {
        let hero = Hero(id: 10, name: "Spider-Man", description: "Red", thumbnail: Image(path: "spider-man-path", ext: "jpg"), urls: [HeroDetails(type: "heroModel", url: "www.marvel.com")])
        
        expect(self.presenter.hero.id) == hero.id
    }

    func testFillViews() {
        
        heroDetailViewController.loadHeroDetail(heroDetail: (name: "name", description: "Description", url: "url"))
        expect(self.heroDetailViewController.labelHeroName.text) == "name"
        expect(self.heroDetailViewController.textViewDescription.text) == "Description"
        expect(self.heroDetailViewController.imageViewHero.image).to(beNil())
    }
}
