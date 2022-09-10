//
//  MoviewListPresenter.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 07/09/22.
//

import Foundation
import UIKit

class MoviewListPresenter {
    fileprivate let router: MovieListRouter
    fileprivate let interactor: MovieListInteractor
    
    init() {
        self.router = MovieListRouter()
        self.interactor = MovieListInteractor()
    }
    
    func didSelect(movie: Movie) {
        router.routeToMovieDetails(with: movie)
    }
    
    func requestForMovies() {
        self.interactor.hitApiForMovies(with: "http://localhost:8080/api/movies")
    }
    
    var movies: Dynamic<[Movie]>? {
        return interactor.movies
    }
    
    var isLoading: Dynamic<Bool> {
        return interactor.isLoading
    }
    
 }

extension MoviewListPresenter: MovieParsingProtocol {
    func name(for movie: Movie)-> String {
        return interactor.name(for: movie)
    }
    
    func rating(for movie: Movie)-> String {
        return interactor.rating(for: movie)
    }
    
    func releaseDate(for movie: Movie)-> String {
        return interactor.releaseDate(for: movie)
    }
    
    func writer(for movie: Movie)-> String {
        return interactor.writer(for: movie)
    }
    
    func storyline(for movie: Movie)-> String {
        return interactor.storyline(for: movie)
    }
    
    func moviePoster(for movie: Movie)-> UIImage? {
        return interactor.moviePoster(for: movie)
    }
    
}
