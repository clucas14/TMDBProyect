//
//  MovieDetailView.swift
//  TMDBProyect
//
//  Created by Casa on 25/11/23.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var movieDetailVM: MovieDetailVM
    
    //    var movie: Movie
    @State var showTrailer = false
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                MoviePosterView(movie: movieDetailVM.selectedMovie, size: .detailPoster)
                MovieCircleAverageView(movie: movieDetailVM.selectedMovie)
                //Hacerlo con offset
                    .padding(.top, -395)
                    .padding(.leading, 250)
                Text(movieDetailVM.selectedMovie.overview)
                    .padding(.bottom, 10)
                HStack() {
                    Text("Date: ")
                        .bold()
                    + Text(movieDetailVM.selectedMovie.releaseDate, style: .date)
                    Spacer()
                }
                .font(.caption)
                //                Link("Go to movie", destination: movie.pageMovie)
                if let _ = movieDetailVM.trailerOfficial {
                    Button {
                        showTrailer.toggle()
                    } label: {
                        Text("View trailer")
                    }
                    .buttonStyle(.bordered)
                }
                
                

                Link(destination: movieDetailVM.selectedMovie.pageMovie) {
                    Image(systemName: "link")
                    Text("Go to movie")
                }
                .buttonStyle(.bordered)
                
            }
            .padding()
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem()], content: {
                    ForEach(movieDetailVM.castCrew) { actor in
                        CastMemberCellView(castMember: actor)
                    }
                })
            }
            .navigationTitle(movieDetailVM.selectedMovie.title)
            //        .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $showTrailer, content: {
            if let keyTrailer = movieDetailVM.trailerOfficial {
                YouTubePlayer(url: .getYouTubeTrailer(key: keyTrailer))
            }
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink("share", item: movieDetailVM.selectedMovie.pageMovie)
            }
        }
    }
}

#Preview {
    NavigationStack{
        MovieDetailView(movieDetailVM: .preview)
    }
}
