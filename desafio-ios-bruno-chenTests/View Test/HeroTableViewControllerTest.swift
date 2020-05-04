//
//  HeroTableViewControllerTest.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 02/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
@testable import desafio_ios_bruno_chen
import XCTest
import Nimble

class HeroTableViewControllerTest: XCTestCase {
    
    var presenter: HeroViewPresenterMock!
    var herosTableViewController: HerosTableViewController!
    
    override func setUp() {
        presenter = HeroViewPresenterMock()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        herosTableViewController = storyboard.instantiateViewController(identifier: "HerosTableViewController")
        herosTableViewController.herosViewPresenter = presenter
        herosTableViewController.loadViewIfNeeded()
        herosTableViewController.viewDidLoad()
    }
    
    func testViewDidLoadCallsPresenter() {
        expect(self.presenter.onViewLoadCalled) == true
    }
    
    func testCallLoadHeroesPresenter() {
        expect(self.presenter.currentPage) == 0
        expect(self.presenter.isLoading) == false
    }
    
    func testFillHeroesArray() {
        let heroTest = [Hero(id: 10, name: "Spider-Man", description: "Red", thumbnail: Image(path: "spider-man-path", ext: "jpg"), urls: [HeroDetails(type: "heroModel", url: "www.marvel.com")])]
        herosTableViewController.loadHeroView(heros: heroTest, total: 5)
        expect(self.herosTableViewController.heroes.first!.id) == heroTest.first!.id
        expect(self.herosTableViewController.heroes.first!.description) == heroTest.first!.description
    }
    
}
