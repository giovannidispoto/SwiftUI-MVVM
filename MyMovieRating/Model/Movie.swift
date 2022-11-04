//
//  Movie.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 26/10/22.
//

import Foundation

struct Movie: Identifiable, Equatable{
    
    let id: UUID //Used in order to identify the object
    var title: String
    var direction: String
    var imageURL: String
    var rating: Int16
    
    //Initialize
    init(id : UUID = UUID(), title: String, direction:String, imageURL: String, rating: Int16){
        self.id = id
        self.title = title
        self.direction = direction
        self.imageURL = imageURL
        self.rating = rating
    }
    
    
}

//["The Social Network", "Trasnformers 1", "Top Gun", "Top Gun: Maverick"]
extension Movie {
    static let sampleData : [Movie] =
    [Movie(title: "The Social Network", direction:"David Fincher", imageURL: "https://pad.mymovies.it/filmclub/2009/12/007/locandina.jpg", rating :4), Movie(title:"Top Gun", direction:"Tony Scott", imageURL: "https://m.media-amazon.com/images/I/71fdgj-xCyL._SL1500_.jpg", rating:5), Movie(title:"Rocky IV",direction:"Sylvester Stallone",imageURL:"https://m.media-amazon.com/images/I/81Tll7Hwl1L._AC_SL1500_.jpg", rating:5)]
}
