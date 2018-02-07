//
//  AppStoreClient.swift
//  iTunesAppStore
//
//  Created by hp ios on 2/6/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
struct AppStoreClient {
   
    func fetchApps(withTerm term:String,
                   inEntity entity:String,
                   completion: @escaping([App]?)->Void )
    {
      
        let searchEndPoint = AppStoreEndPoint.search(term: term, entity: entity)
        let searchUrlRequest = searchEndPoint.request
        
        let networkProcessor = NetworkProcessor(urlRequest: searchUrlRequest)
        networkProcessor.downloadJSONFromURL { (dictionary) in
            
            
            DispatchQueue.main.async
                {
                guard let json = dictionary,
                    let resultDictionary = json["results"] as? [[String:Any]] else
                {
                    completion(nil)
                    return
                }
                // iterate through array of dictionary and fill App Model Class
                
                let apps = resultDictionary.flatMap({
                    appDictionary in
                    return App(dictionary: appDictionary)
                })
                completion(apps)
            }
        }
    }
    
}
