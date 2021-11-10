//
//  Test10.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/11/21.
//

import Foundation


class Coupon2: NSObject {
    //coupon object's properties
    var startDate: Date?
    var endDate: Date?
    var amount: Double = 10.0
    var isValid: Bool = false
    var validDays: Int = 7
    
    //constructor
    init(start: Date, end: Date, couponAmount: Double) {
        super.init()
        self.startDate = start
        self.endDate = end
        self.amount = couponAmount
        self.validateCoupon()
    }
    
    public func validateCoupon() {
        //make sure coupon is 10.00 or less
        if self.amount > 10.0 {
            //return right away with isValid still false
            return
        }
        
        //unwrap the start and end dates
        guard let start = self.startDate, let end = self.endDate else {
            return
        }
        
        //calculate start and end dates
        guard let dayDifference = Calendar.current.dateComponents([.day], from: start, to: end).day, dayDifference <= validDays else {
            return
        }
        
        self.isValid = true
        
    }
    
    
}
