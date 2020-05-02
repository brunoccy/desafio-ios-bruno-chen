//
//  ComicsModel.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 27/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

protocol ComicsModelDelegate: class {
    func loadComicsModel(comics: (title: String, price: Float, description: String?, url: String))
}

class ComicsModel {
    
    weak var delegate: ComicsModelDelegate?
    
    var marvelApi: DataProviderProtocol?
    
    func loadComics(heroid: Int) {
        
        marvelApi = marvelApi ?? MarvelApi()
        
        marvelApi?.loadData(dataType: K.comicsData, int: heroid, completeData: { (comicData) in
             if let comicData = comicData as? ComicData {
                DispatchQueue.main.async {
                    self.mostExpensiveComic(arrayComics: comicData.data.results)
                }
            }
        })
    }
    
    func mostExpensiveComic(arrayComics: [Comics]) {
        var comicsMostExpensive: (title: String, price: Float, description: String?, url: String)
        if arrayComics.count >= 1 {
            var arraySet: [(title: String, price: Float, description: String, url: String)] = []
            for comics in arrayComics {
                let description: String = comics.description ?? ""
                arraySet.append((comics.title, comics.prices.first!.price, description, comics.thumbnail.url))
            }
            arraySet.sort(by: {$0.1 > $1.1})
            comicsMostExpensive = arraySet.first!
        } else {
            comicsMostExpensive = (title: "No have comics", price: 0,description: "", url:"")
        }
        delegate?.loadComicsModel(comics: comicsMostExpensive)
    }
}
