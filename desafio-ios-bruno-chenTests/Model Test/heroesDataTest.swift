//
//  heroesModelTest.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 27/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import desafio_ios_bruno_chen

class heroesDataTest: XCTestCase {

    func testInit() {
        let id = 10
        let name = "Hulk"
        let description = "Green"
        let thumbnail = Image(path: "path", ext: "ext")
        let heroDetails = HeroDetails(type: "jpg", url: "www.marvel.com/")
        let hulk = Hero(id: id, name: name, description: description, thumbnail: thumbnail, urls: [heroDetails])
        XCTAssertEqual(hulk.id, id)
        XCTAssertEqual(hulk.name, name)
        XCTAssertEqual(hulk.description, description)
    }
}
