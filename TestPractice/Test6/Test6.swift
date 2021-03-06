//
//  Test6.swift
//  TestPractice
//
//  Created by Sam Greenhill on 10/9/21.
//

import Foundation

protocol NetworkControllerDelegate {
    func fetch(resourceType: String, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkController {
    
    let baseURL: String
    init(baseURL: String = "https://swapi.dev/api") {
        self.baseURL = baseURL
    }
    
    enum FetchError: Error {
        case network(Error)
        case missingResponse
        case unexpectedResponse(Int)
        case invalidData
        case invalidJSON(Error)
    }
    
    //protocols are not types
    func fetchPlanets(anObject: NetworkControllerDelegate, completion: @escaping (Result<[Planet], Error>) -> Void) {
        anObject.fetch(resourceType: baseURL + "/planets") { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let planetResult = try decoder.decode(PlanetResult.self, from: data)
                    completion(.success(planetResult.results))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}


extension URLSession: NetworkControllerDelegate {
    //creating url and its request
    func fetch(resourceType: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: resourceType) else {
            return
        }
        
        let request = URLRequest(url: url)
        let newTask = URLSession.shared.dataTask(with: request) { (possibleData, possibleResponse, possibleError) in
            guard possibleError == nil else {
                completion(.failure(NetworkController.FetchError.network(possibleError as! Error)))
                return
            }
            
            guard let response = possibleResponse as? HTTPURLResponse else {
                completion(.failure(NetworkController.FetchError.missingResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                completion(.failure(NetworkController.FetchError.unexpectedResponse(response.statusCode)))
                return
            }
            
            guard let receivedData = possibleData else {
                completion(.failure(NetworkController.FetchError.invalidData))
                return
            }
            completion(.success(receivedData))
        }
        newTask.resume()
        
    }
    
    
}
