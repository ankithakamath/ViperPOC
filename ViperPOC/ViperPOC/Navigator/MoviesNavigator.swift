//
//  MoviesRouter.swift
//  ViperPOC
//
//  Created by Ankitha Kamath on 08/02/22.
//
import UIKit

class MoviesNavigator
{
    
    var viewController: UIViewController?
    
    func navigateTo(moviesModel: MoviesModel, presenter: MoviePresenter){
        guard let detailsVC = MoviesBuilder.buildDetailsVC(movie: moviesModel, presenter: presenter) else {return}
        viewController?.navigationController?.pushViewController(detailsVC, animated: true)
        
        
        
    }
    
}
