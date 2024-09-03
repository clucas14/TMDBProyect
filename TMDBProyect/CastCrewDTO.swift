//
//  CastCrewDTO.swift
//  TMDBProyect
//
//  Created by Casa on 28/11/23.
//

import Foundation

struct CastCrewDTO: Codable {
    let id: Int
    let cast: [CastMemberDTO]
}

struct CastMemberDTO: Codable {
    let id: Int
    let name: String
    let profilePath: String?
    let character: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, character
        case profilePath = "profile_path"
    }
}

extension CastMemberDTO {
    var toPresentation: CastMemberPresentation {
        CastMemberPresentation(id: id,
                               name: name,
                               profilePath: profilePath ?? "",
                               character: character ?? "Desconocido")
    }
}
