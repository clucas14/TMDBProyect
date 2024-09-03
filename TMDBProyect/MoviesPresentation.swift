//
//  MoviesPresentation.swift
//  TMDBProyect
//
//  Created by Casa on 23/11/23.
//

import SwiftUI

struct Movie: Hashable, Identifiable {
    let id: Int
    let originalTitle: String
    let title: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let posterPath: String
    
    var voteAverage1Fraction : String {
        voteAverage.formatted(.number.precision(.fractionLength(1)))
    }
    
    var imageMovie: URL {
        mainImageURL.appending(path: posterPath)
    }
    
    var pageMovie: URL {
        mainMovieURL.appending(path: String(id))
    }
    
    var averageColor: Color {
            switch voteAverage {
            case 6.5...10:
                .green
            case 5..<6.5:
                .yellow
            case 0..<5:
                .red
            default:
                .green
            }
        }
}
