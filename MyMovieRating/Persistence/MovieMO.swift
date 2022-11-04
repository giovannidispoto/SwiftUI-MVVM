//
//  MovieMO.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 04/11/22.
//

import Foundation
import CoreData

@objc(MovieMO)
final class MovieMO: NSManagedObject{
    @NSManaged var id: UUID? //Used in order to identify the object
    @NSManaged var title: String
    @NSManaged var direction: String
    @NSManaged var imageURL: String
    @NSManaged var rating: Int16
}

extension MovieMO {
    func convertToMovie() -> Movie {
         Movie(
            id : id ?? UUID(),
            title : title,
            direction: direction,
            imageURL : imageURL,
            rating: rating
        )
    }
}
