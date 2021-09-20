//
//  NetworkResponse.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

struct WeatherResponse: Decodable {
    var city: City
    var list: [ForecastItem]
}
