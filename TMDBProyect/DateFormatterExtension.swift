//
//  DateFormatterExtension.swift
//  TMDBProyect
//
//  Created by Casa on 24/11/23.
//

import Foundation

extension DateFormatter {
    static let dateFormatCustom = {
        let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd"
        
        return date
    }()
}
