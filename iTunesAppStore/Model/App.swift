//
//  App.swift
//  iTunesAppStore
//
//  Created by hp ios on 2/6/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
struct App {

    var name:String
    var price:Double
    var description:String
    var formattedPrice:String
    var artWorkUrl:URL?
    var itunesUrl:URL?
    
    private struct ApiKeys
    {
        static let name = "trackName"
        static let artWorkUrl = "artworkUrl512"
        static let description = "description"
        static let formattedPrice = "formattedPrice"
        static let price = "price"
    }
    
    init?(dictionary:[String:Any])
    {
        guard let name = dictionary[ApiKeys.name] as? String,
              let artworkUrlString = dictionary[ApiKeys.artWorkUrl] as? String,
              let description = dictionary[ApiKeys.description] as? String,
              let formattedPrice = dictionary[ApiKeys.formattedPrice] as? String,
              let price = dictionary[ApiKeys.price] as? Double
        else
        {
            return nil
        }
        
        self.name = name
        self.artWorkUrl = URL(string:artworkUrlString)
        self.description = description
        self.formattedPrice = formattedPrice
        self.price = price
    }
    
    
}
