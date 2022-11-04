//
//  DataManager.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 04/11/22.
//

import Foundation

protocol DataManagerProtocol{
    
    func fetchAllMovies() -> [Movie]
    func add(title: String, direction: String, imageURL: String, rating: Int16)
    func remove(movie: Movie)
    func update(movie: Movie, title: String, direction: String, imageURL: String, rating: Int16 )
    
}
