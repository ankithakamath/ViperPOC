//
//  View.swift
//  ViperPOC
//
//  Created by Ankitha Kamath on 05/02/22.
//

import Foundation
import UIKit



class MoviesViewController: UIViewController
{
    
    var presenter: MoviePresenter = MoviePresenter()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        presenter.presentableDelegate = self
        presenter.fetchMovies()
        presenter.viewController = self
        
    }
    
}

extension MoviesViewController: MoviesPresentableDelegate
{
    
    
    func moviesFetched()
    {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}



extension MoviesViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getMovies().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        print("############### ",indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        let movie = presenter.getMovies()[indexPath.row]
        presenter.fetchImages(imageURL: movie.poster, completionHandler: cell.setImage(image: ))
        cell.configure(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        presenter.navigateToDetailsVC(number: indexPath.row, presenter: presenter)
               
    }
}

