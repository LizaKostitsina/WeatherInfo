//
//  Constants.swift
//  White&FluffyTestTask
//
//  Created by Liza Kostitsina on 30.08.2021.
//

import Alamofire

class NetworkConstants{
    static let urls : [URL] = [
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=46.05&lon=14.51&extra=true")!,
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=36.73&lon=3.09&extra=true")!,
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=11.56&lon=104.92&extra=true")!,
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=48.21&lon=16.37&extra=true")!,
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=1.29&lon=103.85&extra=true")!,
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=50.99&lon=14.42&extra=true")!,
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=55.68&lon=12.57&extra=true")!,
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=50.45&lon=30.52&extra=true")!,
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=53.33&lon=-6.25&extra=true")!,
        URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=64.14&lon=-21.9&extra=true")!
    ]
    static let headers: HTTPHeaders = ["X-Yandex-API-Key":"12bd66d2-c75b-4936-8b8d-7109bfeee345"]
}
