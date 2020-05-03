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
    
    func onViewLoaded(heroesController: HerosTableViewController) {
        onViewLoadCalled = true
    }
    
    private(set) var onEditCalled = false
    
    func onEdit() {
        onEditCalled = true
        
    }
    
    func loadHeroes(currentPage: Int, isLoading: Bool) {
        
    }
    
}
