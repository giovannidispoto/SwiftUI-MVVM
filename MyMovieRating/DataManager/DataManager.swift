//
//  DataManager.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 04/11/22.
//

import Foundation

class DataManager: DataManagerProtocol{
    
    
    static let shared = DataManager()
    
    private var movies = [Movie]()
    
    //Private constructor
    private init(){
    }
    
    func fetchAllMovies() -> [Movie] {
        return movies
    }
    
    func add(title: String, direction: String, imageURL: String, rating: Int) {
        let movie = Movie(title:title, direction: direction, imageURL: imageURL, rating: rating)
        movies.append(movie)
    }
    
    
    func remove(at: IndexSet) {
        movies.remove(at: at.first!)
    }
    
    
    func update(movie: Movie, title: String, direction: String, imageURL: String, rating: Int) {
        let index = movies.firstIndex(of: movie)
        movies[index!].title = title
        movies[index!].direction = direction
        movies[index!].imageURL = imageURL
        movies[index!].rating = rating
        
        
    }
    
    
}
