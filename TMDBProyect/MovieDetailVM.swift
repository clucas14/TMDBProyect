//
//  CastCrewViewModel.swift
//  TMDBProyect
//
//  Created by Casa on 28/11/23.
//

import Foundation

final class MovieDetailVM: ObservableObject {
    let movieDetailInteractor: MovieDetailInteractor
    let selectedMovie: Movie
    
    @Published var castCrew: [CastMemberPresentation] = []
    @Published var trailerMovie: [MoviesVideosPresentation] = []
    
    var trailerOfficial: String? {
        trailerMovie.filter { $0.official == true && $0.type == .trailer }.first?.key
    }
    
    init(castMemberInteractor: MovieDetailInteractor = MovieDetailInteractor(), selectedMovie: Movie) {
        self.movieDetailInteractor = castMemberInteractor
        self.selectedMovie = selectedMovie
        Task { await (getCastCrew(id: selectedMovie.id), getTrailerMovie(movieId: selectedMovie.id))}
    }
    
    func getCastCrew(id: Int) async {
        do {
            let castIn = try await movieDetailInteractor.getCastCrew(id: id)
            await MainActor.run {
                castCrew = castIn
            }
        } catch {
            print(error)
        }
    }
    
    func getTrailerMovie(movieId: Int) async {
        do {
            let trailerIn = try await movieDetailInteractor.getMovieTrailer(movieId: movieId)
            await MainActor.run {
                trailerMovie = trailerIn
            }
        } catch {
            print(error)
        }
    }
}
