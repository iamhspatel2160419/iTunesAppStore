//
//  AppStoreEndPoint.swift
//  iTunesAppStore
//
//  Created by hp ios on 2/6/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation

enum AppStoreEndPoint
{
    case search(term:String,entity:String)
    
    var request : URLRequest
    {
        var Components = URLComponents(string: baseURL)!
        Components.path = path
        Components.queryItems = queryComponents
        let url = Components.url!
        return URLRequest(url: url)
    }
    
    private var baseURL:String
    {
        return "https://itunes.apple.com"
    }
    private var path:String
    {
        switch self
        {
        case .search:
            return "/search"
        }
    }
    private struct ParameterKeys
    {
        static var country = "country"
        static var term = "term"
        static var entity = "entity"
    }
    private struct DefaultValues
    {
        static let country = "us"
        static let term = "apple"
    }
    var parameters:[String : Any]
    {
        switch self {
        case .search(let term,let entity):
            let parameters: [String : Any] =
            [
                ParameterKeys.term : term,
                ParameterKeys.country : DefaultValues.country,
                ParameterKeys.entity : entity
            ]
            return parameters
            
        }
        
    }
    private var queryComponents:[URLQueryItem]
    {
        var components = [URLQueryItem]()
        
        for(key,value) in parameters
        {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.append(queryItem)
        }
        return components
        
    }
    
}
