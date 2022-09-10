//
//  MoviewListViewModel.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 06/09/22.
//

import Foundation
import UIKit

class MoviesListViewModel: MoviesListViewModelProtocol,
                            LoadingProtocol {
    let movies: Dynamic<[Movie]>? = Dynamic(value: [])
    let isLoading: Dynamic<Bool> = Dynamic(value: false)
}


extension MoviesListViewModel {
    func hitApiForMovies(with url: String) {
        self.isLoading.value = true
        self.requestForMovies(with: url) {[weak self] response in
            switch response {
               case .success(let movies):
                 self?.movies?.value = movies.movies
         
               case .failure(let error):
                debugPrint("Error = \(error.localizedDescription)")
            }
            
            self?.isLoading.value = false
        }
        
    }
 
}

