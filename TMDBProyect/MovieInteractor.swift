//
//  MovieInteractor.swift
//  TMDBProyect
//
//  Created by Casa on 23/11/23.
//

import Foundation

protocol MovieInteractorProtocol {
    func getMovies() async throws -> [Movie]
}

struct MovieInteractor: MovieInteractorProtocol {
    func getMovies() async throws -> [Movie] {
        try await getJSON(request: .getCustom(url: .getPopularMovies), type: MoviesResultDTO.self).results.map(\.toPresentation)
    }
}
