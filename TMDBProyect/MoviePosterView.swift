//
//  MoviePosterView.swift
//  TMDBProyect
//
//  Created by Casa on 27/11/23.
//

import SwiftUI

enum PosterSize: CGFloat {
    case cellPoster = 50
    case detailPoster = 250
}

struct MoviePosterView: View {
    let movie: Movie
    var size: PosterSize = .cellPoster
    
    var body: some View {
        AsyncImage(url: movie.imageMovie) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: size.rawValue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } placeholder: {
            Image(systemName: "popcorn")
                .resizable()
                .scaledToFit()
                .frame(width: size.rawValue)
        }
    }
}

#Preview {
    MoviePosterView(movie: .movieTest)
}
