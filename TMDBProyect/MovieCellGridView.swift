//
//  Pruebas.swift
//  TMDBProyect
//
//  Created by Casa on 25/11/23.
//

import SwiftUI

struct MovieCellGridView: View {
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: movie.imageMovie) { image in
                image
                    .resizable()
                    .scaledToFit()
//                    .frame(width: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                Image(systemName: "movieclapper")
            }
//            Text(movie.title)
//                .font(.caption)
            ZStack {
                Circle()
                    .frame(width: 43)
                    .opacity(0.8)
                Circle()
                    .stroke(style: StrokeStyle(lineWidth:5, lineCap: .round))
                    .foregroundColor(Color.black)
                    .opacity(0.1)
                    .overlay(
                        Circle()
                            .trim(from: 0.0, to: movie.voteAverage/10)
                            .stroke(style: StrokeStyle(lineWidth:5, lineCap: .round))
                            .rotation(.degrees(-90))
                            .foregroundColor(movie.averageColor)
                            
                    )
                    .background {
                        Circle()
                            .fill(Color.black)
                    }
                    .padding()
                    .frame(width: 70, height: 70)
                Text(movie.voteAverage1Fraction)
                    .foregroundStyle(movie.averageColor)
                    .bold()
            }
//            .padding(.trailing, 12)
//            .padding(.top, -30)
//            .padding(.bottom, -30)
            .offset(x:0 , y: -30)
        }
        .padding(3)
//        .padding(.bottom, 10)
    }
}

#Preview {
    MovieCellGridView(movie: .movieTest)
}
