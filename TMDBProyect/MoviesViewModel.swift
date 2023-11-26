//
//  MoviesViewModel.swift
//  TMDBProyect
//
//  Created by Casa on 24/11/23.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    let movieInteractor: MovieInteractorProtocol
    
    @Published var movies: [Movie] = []
    
    init(movieInteractor: MovieInteractorProtocol = MovieInteractor()) {
        self.movieInteractor = movieInteractor
        Task {
            await getMovies()
        }
    }
    
    func getMovies() async {
        do {
            let moviesIn = try await movieInteractor.getMovies()
            await MainActor.run {
                movies = moviesIn
            }
        } catch {
            print(error)
        }
    }
}
