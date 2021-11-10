//
//  SignupProtocol.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/7/21.
//

import Foundation

protocol SignupProtocol {
    
    func isFirstNameValid(_ str: String) -> Bool
    
    func isLastNameValid(_ str: String) -> Bool
    
    func isEmailValid(_ str: String) -> Bool
    
    func isPasswordValid(_ str: String) -> Bool
    
    func repeatPasswordValid(_ str: String) -> Bool
}
