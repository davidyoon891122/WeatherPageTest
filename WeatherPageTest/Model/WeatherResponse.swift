//
//  Weather.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/12/18.
//

import Foundation


struct WeatherResponse: Decodable {
    let current: WeatherInfo
    let hourly: [WeatherInfo]
    let daily: [DailyWeather]
    //let lat: Double
}


struct WeatherInfo: Decodable {
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
    let description: String
    let icon: String
}


struct DailyWeather: Decodable {
    let dt: Double
    let temp: DailyTemp
    let weather: [Weather]
}



struct DailyTemp: Decodable {
    let day: Double
    let min: Double
    let max: Double
}
