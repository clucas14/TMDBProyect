//
//  ContentGridView.swift
//  TMDBProyect
//
//  Created by Casa on 26/11/23.
//

import SwiftUI

struct ContentGridView: View {
    @ObservedObject var moviesVM = MoviesViewModel()
    
    let itemAdaptative = GridItem(.adaptive(minimum: 120))
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [itemAdaptative]) {
                    ForEach(moviesVM.movies) { movie in
                        NavigationLink(value: movie) {
                            MovieCellGridView(movie: movie)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(5)
            .navigationTitle("Popular Movies")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movieDetailVM: MovieDetailVM(selectedMovie: movie))
            }
        }
    }
}

#Preview {
    ContentGridView(moviesVM: .preview)
}
