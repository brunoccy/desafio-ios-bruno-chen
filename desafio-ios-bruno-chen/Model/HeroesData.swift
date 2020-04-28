//
//  HeroData.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 24/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

struct HeroesData: Decodable {
    let code: Int
    let data: Data
}

struct Data: Codable {
    let offset: Int
    let limit: Int
    let total: Int //numero total de heroes
    let count: Int
    let results: [Hero]
}

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Image //image link
    let urls: [HeroDetails]
}

struct Image: Codable {
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

struct HeroDetails: Codable {
    let type: String
    let url: String
}
