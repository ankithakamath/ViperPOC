//
//  Interactor.swift
//  ViperPOC
//
//  Created by Ankitha Kamath on 05/02/22.
//

import Foundation
import UIKit

//object and API call
//ref to presenter

protocol MoviePresenterDelegate
{
    func moviesFetched()
  
}

class MoviesDatasource
{
    
    var movieNM = MovieNetworkManager()
    
    var movies: [MoviesModel]?
    var image: UIImage?
    
    var presenterDelegate: MoviePresenterDelegate!
    
    
    func fetchMovies()
    {
        movieNM.fetchData { [weak self] movies in
            self?.movies = movies
            self?.presenterDelegate.moviesFetched()
        }
    }
    
    func fetchImages(imageURL: String,completionHandler:@escaping (UIImage)-> Void)
    {
        movieNM.fetchImage(imageURL: imageURL, completionHandler: completionHandler)
        
    }
}



