//
//  Test3Test.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/7/21.
//

import XCTest
@testable import TestPractice

class Test3Test: XCTestCase {

    
    var sut: NumberValidator!
    
    override func setUpWithError() throws {
        sut = NumberValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

   

}
