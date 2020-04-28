//
//  MarvelApiTest.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 27/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import desafio_ios_bruno_chen

class MarvelApiTest: XCTestCase {

    var comicsModel = ComicsModel()
     
    var comicsMostExpensive: String!

    func testMostExpensiveComics(){
        let thumbnail = ComicsImage(path: "jpg", ext: "www.marvel.com")
        let comics1 = Comics(title: "Hulk", thumbnail: thumbnail, description: "Green", prices: [Price(price: 2.00)])
        let comics2 = Comics(title: "Spider-Man", thumbnail: thumbnail, description: "Red", prices: [Price(price: 3.00)])
        let comics3 = Comics(title: "Thor", thumbnail: thumbnail, description: "Yellow", prices: [Price(price: 1.00)])
        comicsModel.delegate = self
        comicsModel.mostExpensiveComic(arrayComics: [comics1,comics2,comics3])
        XCTAssertTrue(comicsMostExpensive == "Spider-Man" )
    }
}

extension MarvelApiTest: ComicsModelDelegate {
    func loadComicsModel(comics: (title: String, price: Float, description: String?, url: String)) {
        comicsMostExpensive = comics.title
    }
}
