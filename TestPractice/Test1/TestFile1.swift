//
//  TestFile1.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/6/21.
//

import Foundation


public struct Product {
    public var name: String
    public var price: Double
    
    public init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

public struct Coupon {
    public var name: String
    public var discount: Double
    
    public init(name: String, discount: Double) {
        self.name = name
        self.discount = discount
    }
}


public class ShoppingCart {
    private var products = [Product]()
    
    public init() {}
    
    public func add(_ product: Product) {
        products.append(product)
    }
}



public extension ShoppingCart {
    var totalPrice: Double {
        return products.reduce(0, { $0 + $1.price})
    }
}


public extension Product {
    mutating func apply(_ coupon: Coupon) {
        let multiplier = 1 - coupon.discount / 100
        price *= multiplier
    }
}
















