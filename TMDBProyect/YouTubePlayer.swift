//
//  YouTubePlayer.swift
//  TMDBProyect
//
//  Created by Casa on 30/11/23.
//

import WebKit
import SwiftUI

struct YouTubePlayer: UIViewRepresentable {  //Mete una vista de UIKit en SwiftUI
    let url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    //Crea la llamada para abrir en nuestra app la web que le pasemos
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

