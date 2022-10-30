//
//  MovieView.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 26/10/22.
//

import SwiftUI

struct MovieView: View{
    @ObservedObject var vm : MovieViewModel
    @State var movie: Movie
    
    
    var body : some View{
        VStack{
            Text("Directed by: "+movie.direction)
            AsyncImage(url: URL(string: movie.imageURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 500, height: 500)
            
            Text("Rating: "+String(movie.rating)+"/5")
                .font(.system(size:20))
        }.navigationTitle(Text(movie.title))
            .toolbar{
                NavigationLink(destination: EditMovieView(vm, movie)){
                        Text("Edit")
                    }
            }
    }
    
}

struct MovieView_Preview: PreviewProvider{
    static var previews: some View {
        MovieView(vm: MovieViewModel(), movie: Movie.sampleData[0])
    }
}
