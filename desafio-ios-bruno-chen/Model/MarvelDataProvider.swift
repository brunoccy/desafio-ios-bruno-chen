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

protocol DataProviderProtocol {
    func loadData (dataType: String, int: Int, completeData: @escaping (Any?) -> Void)
}

class MarvelDataProvider: DataProviderProtocol {
    private let basicPath = "http://gateway.marvel.com/v1/public/characters"
    private let publicKey = "57ed2b3d64bde531d3b29a57d8501362"
    private let privateKey = "0d7a5599085634152b9ac4ddf2dbddaec242c233"
    private let limit = 20
    
    
    private func apiCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hashMD5 = MD5(ts+privateKey+publicKey).lowercased()
        let apiCredential: String = "ts=\(ts)&apikey=\(publicKey)&hash=\(hashMD5)"
        return apiCredential
    }
    
    func loadData (dataType: String, int: Int, completeData: @escaping (Any?) -> Void) {
        switch dataType {
            case K.heroData:
                loadAllHeroes(page: int, completeHerosData: completeData)
            case K.comicsData:
                loadComics(heroId: int, completeComicsData: completeData)
            default:
                print("Load data error")
            }
    }
    
    private func loadAllHeroes(page: Int, completeHerosData: @escaping (Any?) -> Void) {
        
        let offset = page * limit
        let urlString = basicPath + "?offset=\(offset)&limit=\(limit)&"+apiCredentials()
        
        acessAPI(urlString: urlString, dataType: HeroesData.self, completeData: completeHerosData)
        
    }
    
    private func loadComics(heroId: Int, completeComicsData: @escaping (Any?) -> Void) {
        
        let urlString = basicPath + "/\(heroId)/comics?"+apiCredentials()
        
        acessAPI(urlString: urlString, dataType: ComicData.self, completeData: completeComicsData)
        
    }
    
    private func acessAPI<T>(urlString: String, dataType: T.Type, completeData: @escaping (Any?) -> Void ) where T : Decodable{
       
        AF.request(urlString).responseJSON { (response) in
            guard let data = response.data else {
                completeData(nil)
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(dataType, from: data)
                completeData(decodedData)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }
    }
}
