//
//  WeatherItem.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

import Foundation

struct ForecastItem: Decodable {
    let date: Date
    let avgTemp: Float
    let pressure: Int
    let humidity: Int
    let description: String
    let icon: String
    
    init(from decoder: Decoder) throws {
        let response = try RawForecastItem(from: decoder)
        date = response.dt
        avgTemp = response.temp.day
        pressure = response.pressure
        humidity = response.humidity
        description = response.weather.first?.description ?? ""
        icon = response.weather.first?.icon ?? ""
    }
}

fileprivate struct RawForecastItem: Decodable {
    let dt: Date
    let temp: Temperature
    let pressure: Int
    let humidity: Int
    let weather: [Weather]
}

fileprivate struct Temperature: Decodable {
    let day: Float
}

fileprivate struct Weather: Decodable {
    let description: String
    let icon: String
}
