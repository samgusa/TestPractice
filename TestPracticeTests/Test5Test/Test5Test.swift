//
//  Test5Test.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/9/21.
//

import XCTest
@testable import TestPractice

class Test5Test: XCTestCase {

    var sut: YourClass!
    var userDefaults: MockUserDefaultsProtocol!
    
    
    override func setUpWithError() throws {
        sut = YourClass()
        userDefaults = MockUserDefaultsProtocol()
    }

    override func tearDownWithError() throws {
        sut = nil
        userDefaults = nil
    }

    func testIncreaseCountingShouldIncreaseValueBy1() {
        userDefaults.integerValue = 2
        sut.userDefaults = userDefaults
        
        sut.increaseCounting()
        
        XCTAssertEqual(userDefaults.integerKey, "counting-key")
        XCTAssertEqual(userDefaults.integerValue, 3)
    }

}
