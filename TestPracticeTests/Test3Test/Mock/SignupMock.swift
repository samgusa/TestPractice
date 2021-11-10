//
//  SignupMock.swift
//  TestPracticeTests
//
//  Created by Sam Greenhill on 10/7/21.
//

import Foundation
@testable import TestPractice

class SignupMock: SignupProtocol {
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValid: Bool = false
    var isPasswordValid: Bool = false
    var isRepeatPasswordValid: Bool = false
    
    
    func isFirstNameValid(_ str: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(_ str: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    
    func isEmailValid(_ str: String) -> Bool {
        isEmailValid = true
        return isEmailValid
    }
    
    
    func isPasswordValid(_ str: String) -> Bool {
        isPasswordValid = true
        return isPasswordValid
    }
    
    func repeatPasswordValid(_ str: String) -> Bool {
        isRepeatPasswordValid = true
        return isRepeatPasswordValid
    }
    
}
