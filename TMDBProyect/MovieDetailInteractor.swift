//
//  MovieDetailInteractor.swift
//  TMDBProyect
//
//  Created by Casa on 28/11/23.
//

import Foundation

protocol CastMemberInteractorProtocolo {
    func getCastCrew(id: Int) async throws -> [CastMemberPresentation]
    func getMovieTrailer(movieId: Int) async throws -> [MoviesVideosPresentation]
}

struct MovieDetailInteractor: CastMemberInteractorProtocolo {
    func getCastCrew(id: Int) async throws -> [CastMemberPresentation] {
        try await getJSON(request: .getCustom(url: .getCastMovie(id: id)), type: CastCrewDTO.self).cast.map(\.toPresentation)
    }
    
    func getMovieTrailer(movieId: Int) async throws -> [MoviesVideosPresentation] {
        try await getJSON(request: .getCustom(url: .getTrailerMovie(id: movieId)), type: MoviesVideosResultsDTO.self).results.map(\.toPresentation)
    }
}
