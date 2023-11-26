//
//  ContentView.swift
//  TMDBProyect
//
//  Created by Casa on 23/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = MoviesViewModel()
    @State private var progress = 0.6
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.movies) { movie in
                    NavigationLink (value: movie) {
                        MovieCellView(movie: movie)
                    }
                }
            }
            .navigationTitle("Movies")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    ContentView(vm: .preview)
}
