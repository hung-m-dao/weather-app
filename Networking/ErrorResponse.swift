//
//  ErrorResponse.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

import Foundation

struct ErrorResponse: Decodable, Error {
    let cod: String
    let message: String
}

extension ErrorResponse: LocalizedError {
    public var errorDescription: String? {
        return message
    }
}
