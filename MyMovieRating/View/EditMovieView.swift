//
//  EditMovieView.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 26/10/22.
//

import SwiftUI

struct EditMovieView: View {
    @ObservedObject var vm: MovieViewModel
    @Binding var movie: Movie
    @State private var title: String
    @State private var direction:String
    @State private var imageURL:String
    @State private var rating:Int
    
    init(_ vm: MovieViewModel, _ movie: Binding<Movie>){
        self.vm = vm
        self._movie = movie
        _title = State(initialValue:movie.wrappedValue.title)
        _direction = State(initialValue: movie.wrappedValue.direction)
        _imageURL = State(initialValue:movie.wrappedValue.imageURL)
        _rating = State(initialValue: Int(movie.wrappedValue.rating) - 1)
    }
    
    var body: some View {
        VStack{
            List{
                TextField("Title", text: $title)
                TextField("direction", text: $direction)
                TextField("image URL", text: $imageURL)
                Picker("Rating", selection: $rating){
                    ForEach(1 ..< 6) {
                        Text("\($0)")
                    }
                }
            }
        }.navigationTitle(Text("Edit Information"))
            .toolbar{
                Button(action: {
                    vm.update(for: movie, with: self.title, direction: self.direction, imageURL: self.imageURL, rating: self.rating + 1)
                }){
                    Text("Done")
                }
            }
    }
}

struct EditMovieView_Previews: PreviewProvider {
    static var previews: some View {
        EditMovieView(MovieViewModel(), .constant(Movie.sampleData[0]))
    }
}
