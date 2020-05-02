//
//  exemplo.swift
//  desafio-ios-bruno-chenTests
//
//  Created by Bruno Chen on 30/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import desafio_ios_bruno_chen
import Nimble
import Quick

class exemplo: QuickSpec {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

    }
    
    override func spec() {
          describe("Contas") {
          describe("Soma Simples") {
            it("um igual um") {
              expect(1) == 1
            }
            it("dois igual dois") {
                expect(2) == 3
            }
          }
        }
    }
    

    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

protocol Edible { }

class Dolphin {
  private(set) var isHappy: Bool

  init(happy: Bool) {
    self.isHappy = happy
  }

  /// Makes Doplhin happy
  func eat(_ edible: Edible) {
    isHappy = true
  }
}

class Mackerel: Edible { }
class Cod: Edible { }

class SomethingEdible: Behavior<Edible> {
  override class func spec(_ context: @escaping () -> Edible) {
    var edible: Edible!
    beforeEach {
      edible = context()
    }

    it("makes dolphins happy") {
      let dolphin = Dolphin(happy: false)
      dolphin.eat(edible)
      expect(dolphin.isHappy).to(beTruthy())
    }
  }
}

class MackerelSpec: QuickSpec {
  override func spec() {
    var mackerel: Mackerel!
    beforeEach {
      mackerel = Mackerel()
    }

    itBehavesLike(SomethingEdible.self) { mackerel }
  }
}

class CodSpec: QuickSpec {
  override func spec() {
    var cod: Cod!
    beforeEach {
      cod = Cod()
    }

    itBehavesLike(SomethingEdible.self) { cod }
  }
}
