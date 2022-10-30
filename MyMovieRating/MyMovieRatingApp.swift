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
    var body: some Scene {
        WindowGroup {
            ContentView(movieViewModel: viewModel)
        }
    }
}
