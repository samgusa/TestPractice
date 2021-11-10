//
//  Test8.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/10/21.
//

import Foundation


enum AccountError: Error {
    case insufficientFunds
}


struct Account {
    var balance: Double = 0.0
    
    mutating func deposit(_ amount: Double) {
        self.balance += amount
    }
    
    mutating func widthdraw(_ amount: Double) throws {
        let netBalance = self.balance - amount
        if netBalance < 0 {
            throw AccountError.insufficientFunds
        } else {
            self.balance -= amount
        }
    }
    
}
