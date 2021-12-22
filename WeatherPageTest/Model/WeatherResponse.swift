//
//  Weather.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/12/18.
//

import Foundation


struct WeatherResponse: Decodable {
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
}


struct Current: Decodable {
    let dt: Int
    let temp: Double
    let feelsLike: Double
    let sunrise: Double
    let sunset: Double
    let uvi: Double
    let visibility: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt, temp, weather, sunrise, sunset, uvi, visibility
        case feelsLike = "feels_like"
    }
}

struct Hourly: Decodable {
    let dt: Int
    let temp: Double
    let feelsLike: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt, temp, weather
        case feelsLike = "feels_like"
    }
}

struct Weather: Decodable {
    let main: String
    let descriptionWeather: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case main, icon
        case descriptionWeather = "description"
    }
}


struct Daily: Decodable {
    let dt: Double
    let temp: DailyTemp
    let weather: [Weather]
}



struct DailyTemp: Decodable {
    let day: Double
    let min: Double
    let max: Double
}
