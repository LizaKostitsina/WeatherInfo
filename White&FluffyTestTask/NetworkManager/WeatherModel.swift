//
//  WeatherModel.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 30.08.2021.
//

import Foundation

struct WeatherModel: Codable {
    let geoObject: GeoObject
    let fact: Fact
    let forecasts: [Forecast]
    enum CodingKeys: String, CodingKey {
        case geoObject = "geo_object"
        case fact,forecasts
    }
}
struct Forecast: Codable {
    let parts: Parts
    enum CodingKeys: String, CodingKey {
         case parts
     }
}

struct Parts: Codable {
    let day, evening, morning, nightShort: Hour
    let night, dayShort: Hour

    enum CodingKeys: String, CodingKey {
        case day, evening, morning
        case nightShort = "night_short"
        case night
        case dayShort = "day_short"
    }
}

struct Hour: Codable {
    let temp: Int?
    let tempAvg: Int?
    enum CodingKeys: String, CodingKey {
        case temp
        case tempAvg = "temp_avg"
    }
}
struct GeoObject: Codable {
    let locality: Country
}

struct Country: Codable {
    let name: String
}

struct Fact: Codable {
    let temp: Int
    let condition: Condition
    enum CodingKeys: String, CodingKey {
        case temp
        case condition
    }
}

enum Condition: String, Codable {
    case clear = "clear"
    case cloudy = "cloudy"
    case lightRain = "light-rain"
    case overcast = "overcast"
    case partlyCloudy = "partly-cloudy"
    case rain = "rain"
}
