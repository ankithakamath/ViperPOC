//
//  MovieNetworkManager.swift
//  ViperPOC
//
//  Created by Ankitha Kamath on 08/02/22.
//

import Foundation
import UIKit

class MovieNetworkManager
{
    
    var imageCache = NSCache<NSString, UIImage>()
    
    
    func fetchData(completionHandler:@escaping ([MoviesModel]?) -> Void)
    {
        print("...............")
        var movieInfo = [MoviesModel]()
        
        if let url = URL.init(string: "http://localhost:8000/movies.json" )
        {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error != nil || data == nil
                {
                    print("error", error!)
                }
                else
                {
                    if let response = String.init(data: data!, encoding: .ascii){
                        let jsondata = response.data(using: .utf8)!
                        movieInfo = try! JSONDecoder().decode([MoviesModel].self, from: jsondata)
                        completionHandler(movieInfo)
                        
                    }
                }
            })
            task.resume()
        }
    }
    
    func fetchImage(imageURL: String, completionHandler:@escaping (UIImage)-> Void)
    {
        
        
        guard let url = URL(string: imageURL)
        else { return }
        
        if let image = imageCache.object(forKey: imageURL as NSString){
            completionHandler(image)
            print("fetched via cache", imageURL)
        }
        else
        {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                let defaultImage = UIImage(named: "customimage")
                
                if error != nil || data == nil
                {
                    print("error")
                    
                    completionHandler(defaultImage!)
                }
                else if let data = data
                {
                    guard let image = UIImage(data: data)
                    else
                    {
                        completionHandler(defaultImage!)
                        return 
                    }
                    self.imageCache.setObject(image, forKey: imageURL as NSString)
                    completionHandler(image)
                    print("download via url", imageURL)
                }
            }).resume()
            
        }
    }
}
