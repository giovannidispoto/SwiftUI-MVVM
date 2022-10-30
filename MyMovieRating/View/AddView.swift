//
//  AddView.swift
//  MyMovieRating
//
//  Created by Giovanni Dispoto on 30/10/22.
//

import SwiftUI

struct AddView: View {
    @Binding private var isPresented : Bool
    @ObservedObject private var vm: MovieViewModel
    @State private var title: String
    @State private var direction : String
    @State private var imageURL : String
    @State private var rating : Int
    
    init(isPresented: Binding<Bool>, vm: MovieViewModel) {
        _title = State(initialValue: "")
        _direction = State(initialValue: "")
        _imageURL = State(initialValue: "")
        _rating = State(initialValue: 0)
        _vm = ObservedObject(wrappedValue: vm)
        self._isPresented = isPresented
    }
    
    var body: some View {
        Form{
            
            Section{
                TextField("Title", text: $title)
                TextField("direction", text: $direction)
                TextField("image URL", text: $imageURL)
                Picker("Rating", selection: $rating) {
                    ForEach(1 ..< 6) {
                        Text("\($0)")
                    }
                }
            }
            Section{
                Button(action: {
                    vm.add(title: self.title, direction: self.direction, imageURL: self.imageURL, rating: self.rating + 1)
                    
                    self.title = ""
                    self.direction = ""
                    self.imageURL = ""
                    self.rating = 0
                    
                    self.isPresented.toggle()
                    
                    
                })
                {
                    Text("Insert")
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(isPresented: .constant(true), vm: MovieViewModel.empty())
    }
}
