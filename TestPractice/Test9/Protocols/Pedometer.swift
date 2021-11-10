//
//  Pedometer.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/11/21.
//

import Foundation

protocol Pedometer {
    var pedometerAvailable: Bool { get }
    var permissionDeclined: Bool { get }
    
    func start(dataUpdates: @escaping (PedometerData?, Error?) -> Void, eventUpdates: @escaping (Error?) -> Void)
}

protocol PedometerData {
    var steps: Int { get }
    var distanceTravelled: Double { get }
}
