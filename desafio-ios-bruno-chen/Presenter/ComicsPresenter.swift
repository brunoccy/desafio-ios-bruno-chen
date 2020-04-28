//
//  tableViewPresenter.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 24/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

class ComicsPresenter {
    
    var comicsModel: ComicsModel = ComicsModel()
    var comicsView : ComicsViewController
    
    required init(comicsView : ComicsViewController) {
        self.comicsView = comicsView
    }
    
    var heroId: Int = 0
    
    func loadComic(heroid: Int) {
        comicsModel.delegate = self
        comicsModel.loadComics(heroid: heroid)
    }
}

//MARK: - ComicsModelDelegate

extension ComicsPresenter: ComicsModelDelegate {
    func loadComicsModel(comics: (title: String, price: Float, description: String?, url: String)) {
        comicsView.loadExpensiveComic(comics: comics)
    }
}
