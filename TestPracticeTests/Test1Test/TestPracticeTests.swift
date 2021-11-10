//
//  TestPracticeTests.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/6/21.
//

import XCTest
@testable import TestPractice

class TestPracticeTests: XCTestCase {
    
    private var shoppingCart: ShoppingCart!

    override func setUpWithError() throws {
        shoppingCart = ShoppingCart()
    }

    override func tearDownWithError() throws {
        shoppingCart = nil
    }

    func testCalculatingTotalPrice() {
        XCTAssertEqual(shoppingCart.totalPrice, 0)
        
        shoppingCart.add(Product(name: "Book", price: 20))
        shoppingCart.add(Product(name: "Movie", price: 15))
        
        XCTAssertEqual(shoppingCart.totalPrice, 35)
    }

}
