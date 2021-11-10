//
//  MockPedometer.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/11/21.
//

import Foundation
import CoreMotion
@testable import TestPractice

class MockPedometer: Pedometer {
    
    //since we are mocking everything, we have to create this property inside our mocks so we can mock it.
    var error: Error?
    
    var pedometerAvailable: Bool = true
    var permissionDeclined: Bool = false
    
    private(set) var started: Bool = false
    
    var updateBlock: ((Error?) -> Void)?
    
    var dataBlock: ((PedometerData?, Error?) -> Void)?
    
    //can hard code error we are looking for
    static let notAuthorizedError = NSError(domain: CMErrorDomain, code: Int(CMErrorMotionActivityNotAuthorized.rawValue), userInfo: nil)
    
    func sendData(_ data: PedometerData) {
        self.dataBlock?(data, error)
    }
    
    func start(dataUpdates: @escaping (PedometerData?, Error?) -> Void, eventUpdates: @escaping (Error?) -> Void) {
        self.started = true
        self.updateBlock = eventUpdates
        self.dataBlock = dataUpdates
        
        DispatchQueue.global(qos: .default).async {
            self.updateBlock?(self.error)
        }
    }
    
    
}
