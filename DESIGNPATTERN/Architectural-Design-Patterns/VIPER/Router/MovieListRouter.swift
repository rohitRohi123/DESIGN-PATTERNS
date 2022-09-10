//
//  MovieListRouter.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 07/09/22.
//

import Foundation
import UIKit

struct MovieListRouter {
    func routeToMovieDetails(with movie: Movie) {
        let movieDetailVc = MovieDetailsVcMVVM()
        movieDetailVc.selectedMovie = movie
     
        UIApplication.shared.applicationTopViewController { vc in
            vc?.navigationController?.pushViewController(movieDetailVc, animated: true)
        }
    }
}
