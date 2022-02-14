//
//  Presenter.swift
//  ViperPOC
//
//  Created by Ankitha Kamath on 05/02/22.
//

import Foundation
import UIKit

//ref to interactor, router, view

protocol MoviesPresentableDelegate
{
    func moviesFetched()
   
}

class MoviePresenter {
    
    var dataSource = MoviesDatasource()
    
    var navigator = MoviesNavigator()
    
    var viewController: UIViewController?
    
    var presentableDelegate: MoviesPresentableDelegate!
    
    func fetchMovies()
    {
        dataSource.presenterDelegate = self
        dataSource.fetchMovies()
    }
    
    func getMovies() -> [MoviesModel]
    {
        return dataSource.movies ?? []
    }
    
    func fetchImages(imageURL: String,completionHandler:@escaping (UIImage)-> Void)
    {
        dataSource.presenterDelegate = self
        dataSource.fetchImages(imageURL: imageURL , completionHandler: completionHandler)
    }
    
    func navigateToDetailsVC(number: Int, presenter: MoviePresenter)
    {
        navigator.viewController = viewController
        navigator.navigateTo(moviesModel: getMovies()[number], presenter: presenter)
    }
    
}


extension MoviePresenter: MoviePresenterDelegate
{
   
    
    func moviesFetched()
    {
        presentableDelegate.moviesFetched()
    }
}
