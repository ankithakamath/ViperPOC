//
//  DetailsViewController.swift
//  ViperPOC
//
//  Created by Ankitha Kamath on 08/02/22.
//

import UIKit

class DetailsViewController: UIViewController
{
    
    
    
    var presenter: MoviePresenter!
    
    var movie: MoviesModel!
    
    
    @IBOutlet weak var titleDetail: UILabel!
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var actorDetail: UILabel!
    
    @IBOutlet weak var plotDetail: UILabel!
    
    @IBOutlet weak var ratingDetail: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configure(movie: movie)
        
    }
    
    func configure(movie: MoviesModel)
    {
        
        titleDetail.text = movie.title
        actorDetail.text = movie.actors
        plotDetail.text = movie.plot
        ratingDetail.text = movie.rated
        DispatchQueue.main.async { [self] in
            presenter.fetchImages(imageURL: movie.poster, completionHandler: setImage(image:))
        }
    }
    
    func setImage(image: UIImage)
    {
        DispatchQueue.main.async {
            self.imageDetail.image = image
        }
    }
}
