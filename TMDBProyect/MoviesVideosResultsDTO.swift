//
//  MoviesVideosDTO.swift
//  TMDBProyect
//
//  Created by Casa on 30/11/23.
//

import Foundation


struct MoviesVideosResultsDTO: Codable {
    let results: [MoviesVideosDTO]
}

struct MoviesVideosDTO: Codable {
    let key: String
    let type: videoType
    let official: Bool
    
    var toPresentation: MoviesVideosPresentation {
        MoviesVideosPresentation(key: key,
                     type: type,
                     official: official)
    }
}

enum videoType: String, Codable {
    case trailer = "Trailer"
    case clip = "Clip"
    case teaser = "Teaser"
    case behindTheScenes = "Behind the Scenes"
    case featurette = "Featurette"
    case bloopers = "Bloopers"
}
