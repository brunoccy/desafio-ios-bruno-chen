//
//  ComicsData.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 26/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

struct ComicData: Decodable {
    let data: Datas
}

struct Datas: Codable {
    let limit: Int
    let total: Int
    let results: [Comics]
}

struct Comics: Codable {
    let title: String
    let thumbnail: ComicsImage
    let description: String?
    let prices: [Price]
}

struct Price: Codable {
    let price: Float
}

struct ComicsImage: Codable {
    let path: String
    let ext: String
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys : String, CodingKey {
        case path
        case ext = "extension"
    }
}
