//
//  Planet.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/10/21.
//

import Foundation

struct PlanetResult: Codable {
    let results: [Planet]
}

struct Planet: Codable {
    let name: String
}
