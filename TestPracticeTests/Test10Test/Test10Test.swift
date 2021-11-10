//
//  Test10Test.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/11/21.
//

import XCTest
@testable import TestPractice

class Test10Test: XCTestCase {
    
    var dateNow = Date()
    

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_CouponSuccess() {
        guard let futureDate = Calendar.current.date(byAdding: .day, value: 5, to: dateNow) else {
            XCTFail("testCouponSuccess() failed")
            return
        }
        
        let coupon = Coupon2(start: dateNow, end: futureDate, couponAmount: 5.0)
        
        XCTAssertTrue(coupon.isValid, "testCouponSuccess() succeeded")
        
    }
}
