//
//  tableViewCellTableViewCell.swift
//  ViperPOC
//
//  Created by Ankitha Kamath on 07/02/22.
//

import UIKit

class tableViewCell: UITableViewCell {

  
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieLanguage: UILabel!
    
    @IBOutlet weak var movieRating: UILabel!
    
    @IBOutlet weak var movieRuntime: UILabel!
    
    
    func configure(movie: MoviesModel)
    {
        movieTitle.text = movie.title
        movieRating.text = movie.rated
        movieLanguage.text = movie.language
        movieRuntime.text = movie.runtime
        
    }
    
    func setImage(image: UIImage)
    {
        DispatchQueue.main.async {
            self.movieImage.image = image
        }
    }
}
