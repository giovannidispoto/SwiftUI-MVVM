//
//  MovieViewModel.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 26/10/22.
//

import Foundation

class MovieViewModel : ObservableObject{
    @Published
    private(set) var movies: [Movie] = []
    private var dataManager: DataManager
    
    init(dataManager: DataManager = DataManager.shared){ //Initialize movies with sample data
        //movies = Movie.sampleData
        self.dataManager = dataManager
        
    }
     //Update value of a Movie
    func update(for movie: Movie, with title: String, direction:String, imageURL:String, rating:Int16){
        
        dataManager.update(movie: movie, title: title, direction: direction, imageURL: imageURL, rating: rating)
        fetchAllMovies()
    }
    
    func fetchAllMovies(){
        movies = dataManager.fetchAllMovies()
    }
    
    func add(title: String, direction: String, imageURL: String, rating: Int16){
        //self.movies.append(Movie(title:title, direction: direction, imageURL: imageURL, rating: rating))
        dataManager.add(title:title, direction: direction, imageURL: imageURL, rating: rating)
        fetchAllMovies()
    }
    
    func remove(at offsets: IndexSet){
        dataManager.remove(movie: movies[offsets.first!])
        fetchAllMovies()
    }
    
    static func notEmpty() -> MovieViewModel{
        let vm = MovieViewModel()
        vm.movies = Movie.sampleData
        
        return vm
        
    }
    
    static func empty() -> MovieViewModel{
        let vm = MovieViewModel()
        //vm.movies = Movie.sampleData
        
        return vm
        
    }
    
}
