//
//  MovieCircleAverageView.swift
//  TMDBProyect
//
//  Created by Casa on 28/11/23.
//

import SwiftUI

enum CircleSize: CGFloat {
    case small = 70
    case large = 100
}

struct MovieCircleAverageView: View {
    let movie: Movie
    var circleSize: CircleSize = .large
    @State var progress: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 10)
                .stroke(style: StrokeStyle(lineWidth: circleSize == .large ? 8 : 5, lineCap: .round))
                .foregroundStyle(.black)
                .overlay(
                    Circle()
                        .trim(from: 0.0, to: progress ? (movie.voteAverage/10) : 0)
                        .stroke(style: StrokeStyle(lineWidth: circleSize == .large ? 8 : 5, lineCap: .round))
                        .rotation(.degrees(-90))
                        .foregroundColor(movie.averageColor)
                        .animation(.easeInOut(duration: 2), value: progress)
                )
                .background {
                    Circle()
                        .fill(Color.black)
                }
                .padding()
                .frame(width: circleSize == .large ? 100 : 70)
                .onAppear {
                    progress = true
                }
            Text(movie.voteAverage1Fraction)
                .foregroundStyle(movie.averageColor)
                .font(.system(size: circleSize == .large ? 30 : 20))
                .fontWeight(.light)
                .bold()
        }
    }
}

#Preview {
    MovieCircleAverageView(movie: .movieTest)
}
