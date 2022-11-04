//
//  MyMovieRatingApp.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 26/10/22.
//

import SwiftUI

@main
struct MyMovieRatingApp: App {
    @StateObject var viewModel = MovieViewModel()
    let context = CoreDataHelper.shared.persistentContainer.viewContext
    
    var body: some Scene {
        WindowGroup {
            ContentView(movieViewModel: viewModel)
                .environment(\.managedObjectContext, context)
        }
    }
}
