//
//  MovieDetailsViewModel.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 06/09/22.
//

import Foundation
import AVKit

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    let movie:Dynamic<Movie?>? = Dynamic(value: nil)
    let isReadLess:Dynamic<Bool> = Dynamic(value: false)
    
    private(set) var player: AVPlayer?
    
    func player(for movie: Movie) -> AVPlayer? {
        guard let player = player else {
          if let id = movie.id,
             let url = Bundle.main.url(forResource: "\(id)", withExtension: "mp4") {
              let player = AVPlayer(url: url)
              self.player = player
              
              return player
          }
            
           return nil
        }

        return player
    }
}
