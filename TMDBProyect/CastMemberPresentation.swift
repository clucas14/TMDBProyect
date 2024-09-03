//
//  CastMember.swift
//  TMDBProyect
//
//  Created by Casa on 28/11/23.
//

import Foundation

struct CastMemberPresentation: Identifiable, Hashable {
    let id: Int
    let name: String
    let profilePath: String
    let character: String
    
    var imageMovie: URL {
        mainActorImageURL.appending(path: profilePath)
    }
}
