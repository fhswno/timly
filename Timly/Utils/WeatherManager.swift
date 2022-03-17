//
//  WeatherManager.swift
//  Timly
//
//  Created by David Ohayon Jr. on 14/03/2022.
//

import Foundation
import CoreLocation


struct WeatherBody: Decodable {
    var coord: CoordinatesReturned
    var weather: [WeatherReturned]
    var main: MainReturn
    var name: String
    var wind: WindReturn
    var sys: TimeDataReturn
    
    struct CoordinatesReturned: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherReturned: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainReturn: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }

    struct WindReturn: Decodable {
        var speed: Double
        var deg: Double
    }
    
    struct TimeDataReturn: Decodable {
        var sunrise: Double
        var sunset: Double
    }

   
}

extension WeatherBody.MainReturn {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=40d0a3f390cffc003de8a85e5f7f8be7&units=metric") else { fatalError("Incorrect URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Cannot retrieve Weather Data") }

        let decodedData = try JSONDecoder().decode(WeatherBody.self, from: data)

        return decodedData
    }
}
