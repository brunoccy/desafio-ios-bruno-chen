//
//  MarvelApiTest.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 27/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import desafio_ios_bruno_chen
import Nimble
import Quick

class MarvelApiTest: QuickSpec, ComicsModelDelegate {

    var comicsModel: ComicsModel!
    var comicsMostExpensive: String!
     
// Com Quick
    override func spec() {
        describe("loadComics test") {
            
            beforeEach {
                self.comicsModel = ComicsModel()
            }
            
            it("fetch comics data with data provider") {
                let mockProvider = MarvelDataProviderMock()
                self.comicsModel.marvelDataProvider = mockProvider
                expect(mockProvider.fetchCalled) == false
                let _ = self.comicsModel.loadComics(heroid: 5)
                expect(mockProvider.fetchCalled) == true
            }
            
            it("Get most expensive comics") {
                let thumbnail = ComicsImage(path: "jpg", ext: "www.marvel.com")
                let comics1 = Comics(title: "Hulk", thumbnail: thumbnail, description: "Green", prices: [Price(price: 2.00)])
                let comics2 = Comics(title: "Spider-Man", thumbnail: thumbnail, description: "Red", prices: [Price(price: 3.00)])
                let comics3 = Comics(title: "Thor", thumbnail: thumbnail, description: "Yellow", prices: [Price(price: 1.00)])
                self.comicsModel.delegate = self
                self.comicsModel.mostExpensiveComic(arrayComics: [comics1,comics2,comics3])
                expect(self.comicsMostExpensive) == "Spider-Man"
            }
            
        }
    }
    
    func loadComicsModel(comics: (title: String, price: Float, description: String?, url: String)) {
        comicsMostExpensive = comics.title
    }
}
