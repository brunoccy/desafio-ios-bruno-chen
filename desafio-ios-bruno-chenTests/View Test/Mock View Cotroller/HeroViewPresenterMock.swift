//
//  HeroViewPresenterMock.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 03/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
@testable import desafio_ios_bruno_chen

class HeroViewPresenterMock: HeroViewPresenterProtocol {
    
    private(set) var onViewLoadCalled = false
    
    var currentPage = 10
    
    var isLoading = true
    
    func onViewLoaded(heroesController: HerosTableViewController) {
        onViewLoadCalled = true
    }
    
    func loadHeroes(currentPage: Int, isLoading: Bool) {
        self.currentPage = currentPage
        self.isLoading = isLoading
    }
}
