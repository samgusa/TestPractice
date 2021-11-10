//
//  FeatureWorks.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/7/21.
//

import Foundation

struct UsernameValidator {
    func isValid(_ username: String) -> Bool {
        return username.count > 4
    }
}


protocol HTTPClient {
    func execute(request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}
