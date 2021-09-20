//
//  City.swift
//  WeatherApp
//
//  Created by Hung Dao on 20/09/2021.
//

struct City: Decodable {
    var id: Int
    var name: String
    var country: String
    var population: Int
    var coord: Coordinator
}
