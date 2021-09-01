//
//  NetworkMethods.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 30.08.2021.
//

import Alamofire

class NetworkMethods {
    static func parseJson(with urls: [URL], completion: @escaping ([Weather]) -> Void) {
        var weatherArray = [Weather]()
        for url in urls {
            AF.request(url, method: .get, encoding: JSONEncoding.default, headers: NetworkConstants.headers).responseJSON {
                response in
                if let objects = response.data {
                    do {
                        let json = try JSONDecoder().decode(WeatherModel.self, from: objects)
                        let cityName = json.geoObject.locality.name
                        let currentTempreture = json.fact.temp
                        let condition = json.fact.condition
                        let tempretures = [
                            PartOfTheDay.morning : json.forecasts[0].parts.morning.tempAvg ?? 0,
                            PartOfTheDay.day: json.forecasts[0].parts.day.tempAvg ?? 0,
                            PartOfTheDay.evening : json.forecasts[0].parts.evening.tempAvg ?? 0,
                            PartOfTheDay.night : json.forecasts[0].parts.night.tempAvg ?? 0
                        ]
                        let partsOfTheDayTempreture = PartsOfTheDayTempretureModel(tempretures: tempretures)
                        let weather = Weather(cityName: cityName,
                                              currentTempreture: currentTempreture,
                                              condition:condition,partsOfTheDayTempreture: partsOfTheDayTempreture)
                        weatherArray.append(weather)
                        completion(weatherArray)
                    } catch let error as NSError {
                        print(error)
                    }
                } else {
                    completion([])
                }
            }
        }
    }
}
