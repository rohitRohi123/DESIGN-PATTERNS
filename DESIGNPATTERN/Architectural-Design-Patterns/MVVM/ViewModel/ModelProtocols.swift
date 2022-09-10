//
//  ModelProtocols.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 06/09/22.
//

import Foundation
import UIKit
import AVKit

//MARK: - Protocols
protocol MovieParsingProtocol {
    func name(for movie: Movie)-> String
    func rating(for movie: Movie)-> String
    func releaseDate(for movie: Movie)-> String
    func writer(for movie: Movie)-> String
    func storyline(for movie: Movie)-> String
    func moviePoster(for movie: Movie)-> UIImage?
    
}

extension MovieParsingProtocol {
    func name(for movie: Movie)-> String {
        guard let name = movie.name else {return "" }
        
        return "Name: \(name)"
    }
    
    func rating(for movie: Movie)-> String {
        guard let rating = movie.rating else {return "" }
        
        return "Rating: \(rating)"
    }
    
    func releaseDate(for movie: Movie)-> String {
        guard let releaseDate = movie.release_date else {return "" }
        
        return "Release date: \(releaseDate)"
    }
    
    func writer(for movie: Movie)-> String {
        guard let writer = movie.writer else {return "" }
        
        return "Writer: \(writer)"
    }
    
    func storyline(for movie: Movie)-> String {
        guard let storyline = movie.description else {return "" }
        
        return storyline
        
    }
    
    func moviePoster(for movie: Movie)-> UIImage? {
        guard let id = movie.id,
                !"\(id)".isEmpty else {return nil }
        return UIImage(named: "\(id)")
    }
    
}

protocol MoviesApiProtocol: AnyObject {
    func requestForMovies(with url: String, completion: @escaping ((Result<Movies, NetworkManager.APIError>)->Void))
    
}

extension MoviesApiProtocol {
    func requestForMovies(with url: String, completion: @escaping ((Result<Movies, NetworkManager.APIError>)->Void)) {
        NetworkManager().getRequest(with: url, completionHandler:completion)
    }
    
}

protocol MoviesListViewModelProtocol: MovieParsingProtocol,
    MoviesApiProtocol {
    var movies:Dynamic<[Movie]>? {get }
}

protocol MovieDetailsViewModelProtocol:AnyObject,
                                       MovieParsingProtocol,
                                       MediaPlayerProtocol{
    var movie:Dynamic<Movie?>? {get }
    var isReadLess:Dynamic<Bool> {get }
}


protocol MediaPlayerProtocol {
    func player(for movie: Movie) -> AVPlayer?
    var player: AVPlayer? {get}
}

protocol LoadingProtocol: AnyObject {
    var isLoading: Dynamic<Bool> {get }
}
