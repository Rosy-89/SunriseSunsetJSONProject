//
//  File.swift
//  SunriseSunsetJSONProject
//
//

import Foundation

struct SunRiseModel: Decodable{
    
    let results: Results
}

struct Results: Decodable {
    
    let sunrise: String
    let sunset: String
    let solar_noon: String
    
}


