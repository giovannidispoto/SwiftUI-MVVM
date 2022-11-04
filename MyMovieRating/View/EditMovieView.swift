//
//  EditMovieView.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 26/10/22.
//

import SwiftUI

struct EditMovieView: View {
    @ObservedObject var vm: MovieViewModel
    @State var movie: Movie
    @State private var title: String
    @State private var direction:String
    @State private var imageURL:String
    @State private var rating:Int
    @State private var showingAlert: Bool = false
    
    init(_ vm: MovieViewModel, _ movie: Movie){
        self.vm = vm
        _movie = State(initialValue:movie)
        _title = State(initialValue:movie.title)
        _direction = State(initialValue: movie.direction)
        _imageURL = State(initialValue:movie.imageURL)
        _rating = State(initialValue: Int(movie.rating) - 1)
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
                    if(self.title.isEmpty || self.direction.isEmpty || self.imageURL.isEmpty){
                        self.showingAlert = true
                    }else{
                        vm.update(for: movie, with: self.title, direction: self.direction, imageURL: self.imageURL, rating: Int16(self.rating + 1))
                    }
                }){
                    Text("Done")
                }.alert("Some field are empty", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
    }
}

struct EditMovieView_Previews: PreviewProvider {
    static var previews: some View {
        EditMovieView(MovieViewModel(), Movie.sampleData[0])
    }
}
