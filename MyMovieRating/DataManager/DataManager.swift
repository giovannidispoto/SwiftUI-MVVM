//
//  DataManager.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 04/11/22.
//

import Foundation
import DBHelper
import CoreData

class DataManager: DataManagerProtocol{
    
    
    static let shared = DataManager()
    
    private var movies = [Movie]()
    
    var dbHelper: CoreDataHelper = CoreDataHelper.shared
    
    //Private constructor
    private init(){
    }
    
    private func getMovieMO(for movie: Movie) -> MovieMO? {
        let predicate = NSPredicate(
            format: "id = %@",
            movie.id as CVarArg)
        
        let result = dbHelper.fetchFirst(MovieMO.self, predicate: predicate)
        
        switch result{
        case .success(let movieMO):
            return movieMO
        case .failure(_):
            return nil
            
        }
    }
    
    func fetchAllMovies() -> [Movie] {
        let result: Result<[MovieMO], Error> = dbHelper.fetch(MovieMO.self, predicate: nil)
        
            switch result {
                case .success(let movieMOs):
                    movies =  movieMOs.map { $0.convertToMovie() }
                    return movies
                case .failure(let error):
                    fatalError(error.localizedDescription)
                }
        
        
    }
    
    func add(title: String, direction: String, imageURL: String, rating: Int16) {
        let entity = MovieMO.entity()
        let movie = MovieMO(entity: entity, insertInto: dbHelper.context)
        movie.id = UUID()
        movie.title = title
        movie.direction = direction
        movie.imageURL = imageURL
        movie.rating = rating
        
        dbHelper.create(movie)
    }
    
    
    func remove(movie: Movie) {
        guard let movieMO = getMovieMO(for: movie) else { return }
        dbHelper.delete(movieMO)
                
        
        
    }
    
    func update(movie: Movie, title: String, direction: String, imageURL: String, rating: Int16) {
        guard let movie = getMovieMO(for: movie) else {return}
        movie.title = title
        movie.direction = direction
        movie.imageURL = imageURL
        movie.rating = rating
        dbHelper.update(movie)
        
    }
    
    
}
