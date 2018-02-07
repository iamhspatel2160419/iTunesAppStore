//
//  AppleTableViewCell.swift
//  iTunesAppStore
//
//  Created by hp ios on 2/6/18/Users/hpios/Desktop/DucTran/iTunesAppStore/iTunesAppStore/AppleTableViewCell.swift.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit

class AppleTableViewCell: UITableViewCell {

  
    @IBOutlet weak var appNameLable: UILabel!
    @IBOutlet weak var artworkUIImageView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var appDescriptionLable: UILabel!
    
    var app:App!
    {
        didSet
        {
          self.updateUI()
            
        }
    }
    func updateUI()
    {
        appNameLable.text = app.name
        appDescriptionLable.text = app.description
        
        if app.price == 0
        {
            priceLabel.text = app.formattedPrice
        }
        else
        {
            priceLabel.text = "$\(app.price)"
        }
        if let url = app.artWorkUrl
        {
            let request = URLRequest(url: url)
            let networkProcessor = NetworkProcessor(urlRequest: request)
            networkProcessor.downloadImageDataFromURL({ (data)
                 in
                DispatchQueue.main.async
                    {
                    if let imageData = data
                    {
                        self.artworkUIImageView.image = UIImage(data:imageData)
                        self.artworkUIImageView.layer.cornerRadius = 10.0
                        self.artworkUIImageView.layer.masksToBounds = true
                    }
                }

            })
            
        }
        
    }
    
    
}
