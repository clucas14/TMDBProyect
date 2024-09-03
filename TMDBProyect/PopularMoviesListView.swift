//
//  ContentView.swift
//  TMDBProyect
//
//  Created by Casa on 23/11/23.
//

import SwiftUI

struct PopularMoviesListView: View {
    @ObservedObject var moviesVM: MoviesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(moviesVM.movies) { movie in
                    NavigationLink (value: movie) {
                        MovieCellListView(movie: movie)
                            .onAppear {
                                moviesVM.loadNextPage(movie: movie)
                            }
                    }
                }
            }
            .navigationTitle("Popular Movies")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movieDetailVM: MovieDetailVM(selectedMovie: movie))
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    PopularMoviesListView(moviesVM: .preview)
}
