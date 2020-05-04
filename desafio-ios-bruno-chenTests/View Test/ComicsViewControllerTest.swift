//
//  ComicsViewControllerTest.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 03/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
@testable import desafio_ios_bruno_chen
import XCTest
import Nimble

class ComicsViewControllerTest: XCTestCase {
    
    var presenter: ComicsViewPresenterMock!
    var comicsViewController: ComicsViewController!
    
    override func setUp() {
        presenter = ComicsViewPresenterMock()
        
        let hero = Hero(id: 10, name: "Spider-Man", description: "Red", thumbnail: Image(path: "spider-man-path", ext: "jpg"), urls: [HeroDetails(type: "heroModel", url: "www.marvel.com")])
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        comicsViewController = storyboard.instantiateViewController(identifier: "ComicsViewController")
        comicsViewController.comicsPresenter = presenter
        comicsViewController.hero = hero
        comicsViewController.loadViewIfNeeded()
        comicsViewController.viewDidLoad()
    }
    
    func testViewDidLoadCallsPresenter() {
        expect(self.presenter.onViewLoadCalled) == true
    }
    
    func testCallLoadHeroesPresenter() {
        expect(self.presenter.heroid) == 10
    }
    
    func testFillViews() {
        let comics = (title: "Title", price: 1.00 as Float, description: "Description" as String?, url: "url")
        comicsViewController.loadExpensiveComic(comics: comics)
        expect(self.comicsViewController.labelComicsName.text) == "Title"
        expect(self.comicsViewController.labelPrice.text) == "US$: 1.0"
        expect(self.comicsViewController.textFieldDescription.text) == "Description"
        expect(self.comicsViewController.imageViewComics.image).to(beNil())
        
    }
    
}
