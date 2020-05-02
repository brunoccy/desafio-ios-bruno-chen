//
//  File.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 02/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
@testable import desafio_ios_bruno_chen

class MarvelDataProviderMock: NSObject, DataProviderProtocol {
    
    var fetchCalled = false
    
    func loadData(dataType: String, int: Int, completeData: @escaping (Any?) -> Void) {
        fetchCalled = true
        completeData(5)
    }
}
