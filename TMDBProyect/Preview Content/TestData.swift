//
//  MovieTest.swift
//  TMDBProyect
//
//  Created by Casa on 24/11/23.
//

import Foundation

extension Movie {   
    static let movieTest = Movie(id: 872585, 
                                 originalTitle: "Oppenheimer", 
                                 title: "Oppenheimer",
                                 overview: "The story of J. Robert Oppenheimer's role in the development of the atomic bomb during World War II.",
                                 releaseDate: DateFormatter.dateFormatCustom.date(from: "2023-07-19")!,
                                 voteAverage: 9.168,
                                 posterPath: "/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg")
}

struct TestMovieInteractor: MovieInteractorProtocol {
    let urlMovies = Bundle.main.url(forResource: "testMovies", withExtension: "json")!
    
//    func loadTestData<JSON>(url: URL) throws -> JSON where JSON: Codable {
//        let data = try Data(contentsOf: url)
//        return try JSONDecoder().decode(JSON.self, from: data)
//    }
//    
//    func getMovies() async throws -> [Movie] {
//        try loadTestData(url: urlMovies)
//    }
    
    func getMovies(page: Int) async throws -> [Movie] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormatCustom)
        
        let data = try Data(contentsOf: urlMovies)
        return try decoder.decode(MoviesResultDTO.self, from: data).results.map(\.toPresentation)
    }
}

extension MoviesViewModel {
    static let preview = MoviesViewModel(movieInteractor: TestMovieInteractor())
}

extension CastMemberPresentation {
    static let castMemberTest = CastMemberPresentation(id: 2037, name: "Cillian Murphy", profilePath: "/3DZAf9CwXmfV2HZOEdqeZAGTndV.jpg", character: "J. Robert Oppenheimer")
}

struct TestCastMember: CastMemberInteractorProtocolo {
    var urlTest = Bundle.main.url(forResource: "TestCast", withExtension: "json")!
    
    func getCastCrew(id: Int) async throws -> [CastMemberPresentation] {
        let data = try Data(contentsOf: urlTest)
        return try JSONDecoder().decode(CastCrewDTO.self, from: data).cast.map((\.toPresentation))
    }
    
    func getMovieTrailer(movieId: Int) async throws -> [MoviesVideosPresentation] {
        []
    }
}

extension MovieDetailVM {
    static let preview = MovieDetailVM(castMemberInteractor: MovieDetailInteractor(), selectedMovie: .movieTest)
}
