//
//  URLRequest.swift
//  TMDBProyect
//
//  Created by Casa on 23/11/23.
//

import Foundation

extension URLRequest {
    static func getCustom(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 30 // Por defecto son 60
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(String(data: Data(AK), encoding: .utf8)!, forHTTPHeaderField: "Authorization")
        return request
    }
    
    static func getPaginateMovies(url: URL, page: Int = 1) -> URLRequest {
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: "\(page)")])
        request.timeoutInterval = 30
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(String(data: Data(AK), encoding: .utf8)!, forHTTPHeaderField: "Authorization")
        return request
    }
    
    
}
