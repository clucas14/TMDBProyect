//
//  NetworkError.swift
//  TMDBProyect
//
//  Created by Casa on 23/11/23.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case noHTTP
    case status(Int)
    case general(Error)
    case json(Error)
    
    var description: String {
        switch self {
        case .noHTTP:
            "No es una llamada HTTP"
        case .status(let int):
            "El status code es: \(int)"
        case .general(let error):
            "Error general \(error)"
        case .json(let error):
            "Fallo en el parsing \(error)"
        }
    }
}
