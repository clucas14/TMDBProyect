//
//  MovieDetailView.swift
//  TMDBProyect
//
//  Created by Casa on 25/11/23.
//

import SwiftUI

struct MovieDetailView: View {
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
        
        ScrollView {
            VStack(alignment: .center) {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    Image(systemName: "movieclapper")
                }
                Text(movie.overview)
                    .padding(.bottom, 10)
                HStack() {
                    Text("Date: ")
                        .bold()
                    + Text(movie.releaseDate, style: .date)
                    Spacer()
                }
                .font(.caption)
                        ZStack {
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth:8, lineCap: .round))
                                .foregroundColor(Color.black)
                                .opacity(0.1)
                                .overlay(
                                    Circle()
                                        .trim(from: 0.0, to: movie.voteAverage/10)
                                        .stroke(style: StrokeStyle(lineWidth:8, lineCap: .round))
                                        .rotation(.degrees(-90))
                                        .foregroundColor(averageColor)
                                    
                                )
                                .padding()
                                .frame(width: 150, height: 150)
                            Text("\(movie.voteAverage.formatted(.number.precision(.fractionLength(1))))")
                                .foregroundStyle(averageColor)
                                .font(.system(size: 45))
                                .fontWeight(.light)
                                .bold()
                        
                    
                }
            }
            .navigationTitle(movie.title)
    //        .navigationBarTitleDisplayMode(.inline)
        .padding()
        }
    }
}

#Preview {
    NavigationStack{
        MovieDetailView(movie: .movieTest)
    }
}
