//
//  Pruebas.swift
//  TMDBProyect
//
//  Created by Casa on 25/11/23.
//

import SwiftUI

struct MovieCellListView: View {
    var movie: Movie
    
    var body: some View {
        
        HStack (alignment: .top) {
            MoviePosterView(movie: movie, size: .cellPoster)
            VStack(alignment: .leading) {
                Text(movie.title)
                Text(movie.releaseDate, style: .date)
                    .font(.caption)
                    .opacity(0.6)
            }
            
            Spacer()
            MovieCircleAverageView(movie: movie, circleSize: .small)
//            ZStack {
//                Circle()
//                    .stroke(style: StrokeStyle(lineWidth:5, lineCap: .round))
//                    .foregroundColor(Color.black)
//                    .opacity(0.1)
//                    .overlay(
//                        Circle()
//                            .trim(from: 0.0, to: movie.voteAverage/10)
//                            .stroke(style: StrokeStyle(lineWidth:5, lineCap: .round))
//                            .rotation(.degrees(-90))
//                            .foregroundColor(movie.averageColor)
//                            
//                    )
//                    .padding()
//                    .frame(width: 70, height: 70)
//                Text(movie.voteAverage1Fraction)
//                    .foregroundStyle(movie.averageColor)
//                    .bold()
//            }
        }
    }
}

#Preview {
    MovieCellListView(movie: .movieTest)
}
