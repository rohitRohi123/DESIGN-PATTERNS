//
//  Movie.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 04/09/22.
//

import Foundation

struct Movies: Codable {
    let movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case movies = "movies"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movies = try values.decodeIfPresent([Movie].self, forKey: .movies)
    }
    
}

struct Movie : Codable {
    let id : Int?
    let name : String?
    let release_date : String?
    let writer : String?
    let rating : String?
    let description : String?
    let image : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case release_date = "release_date"
        case writer = "writer"
        case rating = "rating"
        case description = "description"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        writer = try values.decodeIfPresent(String.self, forKey: .writer)
        rating = try values.decodeIfPresent(String.self, forKey: .rating)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
