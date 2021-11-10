//
//  SignupFormValidator.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/9/21.
//

import Foundation


class SignupFormValidator {
    
    private let invalidCharacters = CharacterSet(charactersIn: "{}$#%*&.,/?!@")
    
    
    func isFirstNameValid(_ firstName: String) throws -> Bool {
        var returnValue = true
        if (firstName.rangeOfCharacter(from: invalidCharacters) != nil) {
            throw SignupError.illegalCharacterFound
        }
        
        if firstName.count < 2 || firstName.count > 10 {
            returnValue = false
        }
        
        
        return returnValue
    }
}
