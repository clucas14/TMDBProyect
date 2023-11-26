//
//  Pruebas.swift
//  TMDBProyect
//
//  Created by Casa on 25/11/23.
//

import SwiftUI

struct MovieCellView: View {
    var movie: Movie
    
    var averageColor: Color {
            switch movie.voteAverage {
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
    
    var body: some View {
        let image = URL(string: "https://image.tmdb.org/t/p/w500/")!
        let imageURL = image.appending(path: movie.posterPath)
        
        HStack (alignment: .top) {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                Image(systemName: "movieclapper")
            }
                Text(movie.title)
            Spacer()
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth:5, lineCap: .round))
                    .foregroundColor(Color.black)
                    .opacity(0.1)
                    .overlay(
                        Circle()
                            .trim(from: 0.0, to: movie.voteAverage/10)
                            .stroke(style: StrokeStyle(lineWidth:5, lineCap: .round))
                            .rotation(.degrees(-90))
                            .foregroundColor(averageColor)
                            
                    )
                    .padding()
                    .frame(width: 70, height: 70)
                Text("\(movie.voteAverage.formatted(.number.precision(.fractionLength(1))))")
                    .foregroundStyle(averageColor)
                    .bold()
            }
        }
    }
}

#Preview {
    MovieCellView(movie: .movieTest)
}
