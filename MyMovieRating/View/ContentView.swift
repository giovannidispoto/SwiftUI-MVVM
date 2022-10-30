//
//  ContentView.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 26/10/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var movieViewModel: MovieViewModel
    @State private var isPresented = false
    
    
    init(movieViewModel: MovieViewModel){
        _movieViewModel = ObservedObject(wrappedValue: movieViewModel)
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if(movieViewModel.movies.isEmpty == false){
                    List{
                        ForEach($movieViewModel.movies){$movie in
                            //Text(title)
                            NavigationLink(destination: MovieView(vm: movieViewModel, movie: $movie)){
                                Text(movie.title)
                            }
                        }.onDelete(perform: movieViewModel.remove)
                    }
                }else{
                    Text("Nothing to show here")
                    Text("Start by adding a movie")
                }
            }.navigationTitle(Text("My Movies"))
                .toolbar{
                    Button(action:{
                        self.isPresented = true
                    }){
                        Image(systemName: "plus")
                    }
                }
        }
        .sheet(isPresented: $isPresented, onDismiss: {}){
            AddView(isPresented: $isPresented, vm: movieViewModel)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movieViewModel: MovieViewModel.notEmpty())
    }
}
