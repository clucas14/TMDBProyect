//
//  MoviesViewModel.swift
//  TMDBProyect
//
//  Created by Casa on 24/11/23.
//

import Foundation

enum ViewState {
    case loading
    case loaded
    case error
}

final class MoviesViewModel: ObservableObject {
    let movieInteractor: MovieInteractorProtocol
    @Published var viewState: ViewState = .loading
    
    var page = 1
    
    @Published var movies: [Movie] = []
    
    init(movieInteractor: MovieInteractorProtocol = MovieInteractor()) {
        self.movieInteractor = movieInteractor
        Task {
            await getMovies()
        }
    }
    
    func getMovies() async {
        do {
            let moviesIn = try await movieInteractor.getMovies(page: page)
            await MainActor.run {
                movies += moviesIn
                viewState = .loaded
            }
        } catch {
            await MainActor.run {
                viewState = .error
            }
        }
    }
    
    func isLastItem(movie: Movie) -> Bool {
        movies.last?.id == movie.id
    }
    
    func loadNextPage(movie: Movie) {
        if isLastItem(movie: movie) {
            page += 1
            Task {
                await getMovies()
            }
        }
    }
    
}
