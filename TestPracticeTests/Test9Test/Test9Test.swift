//
//  Test9Test.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/11/21.
//

import XCTest
@testable import TestPractice

class Test9Test: XCTestCase {

    func test_CMPedometer_LoadingHistorialData() {
        let mock = MockPedometer()
        let pedometerVM = PedometerViewModel(pedometer: mock)
        
        pedometerVM.startPedometer()
        XCTAssertTrue(mock.started)
    }
    
    func test_PedometerAuthorized_ShouldBeInProgress() {
        let mock = MockPedometer()
        mock.permissionDeclined = false
        let pedometerVM = PedometerViewModel(pedometer: mock)
        
        pedometerVM.startPedometer()
        
        XCTAssertEqual(pedometerVM.appState, .inProgress)
    }
    
    func test_PedometerNotAuthorized_DoesNotStart() {
        let mock = MockPedometer()
        mock.permissionDeclined = true
        let pedometerVM = PedometerViewModel(pedometer: mock)
        pedometerVM.startPedometer()
        XCTAssertEqual(pedometerVM.appState, .notStarted)
    }
    
    func test_WhenAuthDeniedAfterStartGenerateError() {
        let mock = MockPedometer()
        mock.error = MockPedometer.notAuthorizedError
        let pedometerVM = PedometerViewModel(pedometer: mock)
        
        let exp = expectation(for: NSPredicate(block: { (thing, _) -> Bool in
            //return bool here HERE
            let vm = thing as! PedometerViewModel
            return vm.appState == .notAuthorized
        }), evaluatedWith: pedometerVM, handler: nil)
        pedometerVM.startPedometer()
        wait(for: [exp], timeout: 2.0)
    }
    
    func test_WhenPedometerUpdatesThenUpdatesViewModel() {
        let data = MockData9(steps: 100, distanceTravelled: 10)
        
        let mock = MockPedometer()
        let pedometerVM = PedometerViewModel(pedometer: mock)
        
        pedometerVM.startPedometer()
        mock.sendData(data)
        
        XCTAssertEqual(100, pedometerVM.steps)
        XCTAssertEqual(10, pedometerVM.distanceTravelled)
        
    }
    
    
    
    
}
