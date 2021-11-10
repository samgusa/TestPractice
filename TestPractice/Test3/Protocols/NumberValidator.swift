//
//  NumberValidator.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/7/21.
//

import Foundation

class NumberValidator {
    
    var number1 = Int()
    
    var number2 = Int()
    
    func addTwoNumbers(_ items: NumberValidatorProtocol) -> Bool {
        return items.areNumsPositive(number1: number1, num2: number2)
    }
}
