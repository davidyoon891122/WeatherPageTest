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
    let humidity: Double
    let windSpeed: Double
    let pressure: Double
    let clouds: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt, temp, weather, sunrise, sunset, uvi, visibility, humidity, pressure, clouds
        case feelsLike = "feels_like"
        case windSpeed = "wind_speed"
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
    let sunrise: Double
    let sunset: Double
    let feelLike: FeelLike
    let temp: DailyTemp
    let weather: [Weather]
    let humidity: Double
    let pressure: Double
    let snow: Double?
    let rain: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp, weather, humidity, pressure, snow, rain
        case feelLike = "feels_like"
    }
    
}



struct DailyTemp: Decodable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
}


struct FeelLike: Decodable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}
