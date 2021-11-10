//
//  Test7Test.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/10/21.
//

import XCTest
@testable import TestPractice

class Test7Test: XCTestCase {

    let banana = FoodItem(name: "Banana", caloriesFor100Grams: 89, grams: 118)
    let steak = FoodItem(name: "Steak", caloriesFor100Grams: 271, grams: 225)
    let goatCheese = FoodItem(name: "Goat Cheese", caloriesFor100Grams: 364, grams: 28)
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyMeal() {
        let meal = Meal()
        XCTAssertEqual(meal.calories, 0, "An Empty emal should have 0 calories")
    }
    
    
    func testCalories() {
        var meal = Meal()
        meal.add(banana)
        meal.add(steak)
        meal.add(goatCheese)
        XCTAssertEqual(meal.items.count, 3)
        XCTAssertEqual(meal.calories, 534)
    }
    
    
}
