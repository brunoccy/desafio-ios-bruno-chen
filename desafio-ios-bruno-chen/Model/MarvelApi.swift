//
//  MarvelApi.swift
//  desafio-ios-bruno-chen
//
//  Created by Bruno Chen on 24/04/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftHash

class MarvelApi {
    static private let basicPath = "http://gateway.marvel.com/v1/public/characters"
    static private let publicKey = "57ed2b3d64bde531d3b29a57d8501362"
    static private let privateKey = "0d7a5599085634152b9ac4ddf2dbddaec242c233"
    static private let limit = 20
    
    private class func apiCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hashMD5 = MD5(ts+privateKey+publicKey).lowercased()
        let apiCredential: String = "ts=\(ts)&apikey=\(publicKey)&hash=\(hashMD5)"
        return apiCredential
    }
    
    class func loadAllHeroes(page: Int, completeHerosData: @escaping (HeroesData?) -> Void) {
        
        let offset = page * limit
        let urlString = basicPath + "?offset=\(offset)&limit=\(limit)&"+apiCredentials()
        AF.request(urlString).responseJSON { (response) in
            guard let data = response.data,
                let marvelData = try? JSONDecoder().decode(HeroesData.self, from: data) else {
                completeHerosData(nil)
                return
            }
            completeHerosData(marvelData)
        }
    }
    
    class func loadComics(heroId: Int, completeComicsData: @escaping (ComicData?) -> Void) {
        
        let urlString = basicPath + "/\(heroId)/comics?"+apiCredentials()
        AF.request(urlString).responseJSON { (response) in
            guard let data = response.data,
                let marvelComicData = try? JSONDecoder().decode(ComicData.self, from: data) else {
                completeComicsData(nil)
                return
            }
            completeComicsData(marvelComicData)
        }
    }
}
