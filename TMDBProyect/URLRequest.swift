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
        request.timeoutInterval = 60
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue(String(data: Data(AK), encoding: .utf8)!, forHTTPHeaderField: "Authorization")
        
        return request
    }
}
