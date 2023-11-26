//
//  MoviesPresentation.swift
//  TMDBProyect
//
//  Created by Casa on 23/11/23.
//

import Foundation

struct Movie: Hashable, Identifiable {
    let id: Int
    let originalTitle: String
    let title: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let posterPath: String
}
