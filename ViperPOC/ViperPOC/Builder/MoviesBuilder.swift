//
//  MoviesBuilder.swift
//  ViperPOC
//
//  Created by Ankitha Kamath on 08/02/22.
//

import Foundation
import UIKit

class MoviesBuilder
{
    
    private enum BuilderConstant
    {
        static let detailsViewControllerIdentifier = "DetailsViewController"
        static let segueIdentifier = "DetailsView"
        
    }
    
    static func buildDetailsVC(movie: MoviesModel, presenter: MoviePresenter) -> UIViewController?
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: BuilderConstant.detailsViewControllerIdentifier) as? DetailsViewController
        else
        {
            return nil
        }
        viewController.presenter = presenter
        viewController.movie = movie
        return viewController
    }
}
