//
//  Test5.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/9/21.
//

import Foundation

protocol UserDefaultProtocol {
    func integer(forKey defaultName: String) -> Int
    func set(_ value: Int, forKey defaultName: String)
}


extension UserDefaults: UserDefaultProtocol {}

class YourClass {
    
    var userDefaults: UserDefaultProtocol = UserDefaults.standard
    
    func increaseCounting() {
        let key = "counting-key"
        let count = userDefaults.integer(forKey: key)
        userDefaults.set(count + 1, forKey: key)
    }
}


class MockUserDefaultsProtocol: UserDefaultProtocol {
    
    var integerKey: String?
    var integerValue: Int?
    
    func integer(forKey defaultName: String) -> Int {
        integerKey = defaultName
        return integerValue ?? 0
    }
    
    func set(_ value: Int, forKey defaultName: String) {
        integerKey = defaultName
        integerValue = value
    }
    
    
}
