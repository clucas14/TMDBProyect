//
//  MovieInteractor.swift
//  TMDBProyect
//
//  Created by Casa on 23/11/23.
//

import Foundation

protocol MovieInteractorProtocol {
    func getMovies(page: Int) async throws -> [Movie]
}

struct MovieInteractor: MovieInteractorProtocol {
    func getMovies(page: Int) async throws -> [Movie] {
//        try await getJSON(request: .getCustom(url: .getPopularMovies), type: MoviesResultDTO.self).results.map(\.toPresentation)
        try await getJSON(request: .getPaginateMovies(url: .getPopularMovies, page: page), type: MoviesResultDTO.self).results.map(\.toPresentation)
    }
}
