//
//  NetworkResponse.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

struct WeatherResponse: Codable {
    var city: City
    var list: [WeatherItem]
}
