//
//  MoviesMainView.swift
//  TMDBProyect
//
//  Created by Casa on 27/11/23.
//

import SwiftUI

struct MoviesMainView: View {
    @ObservedObject var moviesVM = MoviesViewModel()
    
    var body: some View {
        switch moviesVM.viewState {
        case .loading:
            ProgressView()
                .controlSize(.large)
        case .loaded:
            PopularMoviesListView(moviesVM: moviesVM)
        case .error:
            CustomAlertView(title: "Error de carga",
                            message: "No se han podido cargar los datos, inténtelo de nuevo",
                            buttonText: "Volver a intentar") {
                Task {await moviesVM.getMovies() }
            }
        }
    }
}

#Preview {
    MoviesMainView(moviesVM: .preview)
}
