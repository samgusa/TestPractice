//
//  ProtocolTests.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/7/21.
//

import Foundation

class ProtocolTest: SignupProtocol {
    
    func isFirstNameValid(_ str: String) -> Bool {
        var returnValue = true
        
        if str.isEmpty {
            returnValue = false
        }
        return returnValue
    }
    
    func isLastNameValid(_ str: String) -> Bool {
        var returnValue = true
        if str.isEmpty {
            returnValue = false
        }
        return returnValue
    }
    
    
    func isEmailValid(_ str: String) -> Bool {
        var returnValue = true
        
        if str.isEmpty {
            returnValue = false
        }
        return returnValue
    }
    
    
    func isPasswordValid(_ str: String) -> Bool {
        var returnValue = true
        
        if str.isEmpty {
            returnValue = false
        }
        return returnValue
    }
    
    
    func repeatPasswordValid(_ str: String) -> Bool {
        var returnValue = true
        
        if str.isEmpty {
            returnValue = false
        }
        return returnValue
    }
    
    
    
    
}
