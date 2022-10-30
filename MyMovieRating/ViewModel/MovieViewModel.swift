//
//  MovieViewModel.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 26/10/22.
//

import Foundation

class MovieViewModel : ObservableObject{
     @Published private(set) var movies: [Movie]
    
    init(){ //Initialize movies with sample data
        //movies = Movie.sampleData
        self.movies = []
    }
     //Update value of a Movie
    func update(for movie: Movie, with title: String, direction:String, imageURL:String, rating:Int){
        if let index = movies.firstIndex(where: {$0.id == movie.id}){
            self.movies[index].title = title
            self.movies[index].direction = direction
            self.movies[index].imageURL = imageURL
            self.movies[index].rating = rating
        }
    }
    
    func add(title: String, direction: String, imageURL: String, rating: Int){
        
        self.movies.append(Movie(title:title, direction: direction, imageURL: imageURL, rating: rating))
        
    }
    
    func remove(at offsets: IndexSet){
        self.movies.remove(at: offsets.first!)
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
