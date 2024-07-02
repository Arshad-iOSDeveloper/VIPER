//
//  LoginEntity.swift
//  ViperDemo1
//
//  Created by Apple on 29/08/22.
//

//Api
//https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&formatted=0

import Foundation

struct ApiResponse: Codable{
    let results: ApiResponseResults
    let status: String
}

struct ApiResponseResults: Codable {
    let sunrise: String?
    let sunset: String?
    let solar_noon: String?
    let day_length: Int?
    let civil_twilight_begin: String?
    let civil_twilight_end: String?
    let nautical_twilight_begin: String?
    let nautical_twilight_end: String?
    let astronomical_twilight_begin: String?
    let astronomical_twilight_end: String?
}
