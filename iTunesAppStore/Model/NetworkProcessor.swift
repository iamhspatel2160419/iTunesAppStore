//
//  NetworkProcessor.swift
//  iTunesAppStore
//
//  Created by hp ios on 2/6/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//
import Foundation

class NetworkProcessor
{
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    
    let url: URLRequest
    
    init(urlRequest: URLRequest)
    {
        self.url = urlRequest
    }
    
    typealias JSON = [String:Any]
    typealias JSONHandler = (([String : Any]?) -> Void)
    typealias imageDataHandler = ((Data?) -> Void)
    
    func downloadJSONFromURL(_ completion: @escaping JSONHandler)
    {
        let request = url
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil {
                
                if data == nil{
                    completion(nil)
                }
                else{
                    if let httpResponse = response as? HTTPURLResponse {
                        switch httpResponse.statusCode {
                        case 200:
                            // successful response
                            if let data = data {
                                do {
                                    let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                    
                                    completion(jsonDictionary as? [String : Any])
                                    
                                } catch let error as NSError {
                                    print("Error processing json data: \(error.localizedDescription)")
                                }
                                
                            }
                            
                            
                        default:
                            print("HTTP Reponse Code: \(httpResponse.statusCode)")
                        }
                    }
                }
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
        dataTask.resume()
    }
    
    
    func downloadImageDataFromURL(_ completion: @escaping imageDataHandler)
    {
        let request = url
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil {
                
                if data == nil{
                    completion(nil)
                }
                else
                {
                    if let httpResponse = response as? HTTPURLResponse {
                        switch httpResponse.statusCode {
                        case 200:
                            // successful response
                            completion(data)
                            
                        default:
                            print("HTTP Reponse Code: \(httpResponse.statusCode)")
                        }
                    }
                }
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        dataTask.resume()
    }
    
    
    
    
}
