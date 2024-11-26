//
//  NetworkManager.swift
//  fdci-iOS-technical
//
//  Created by John Patrick Echavez on 11/26/24.
//

import UIKit


class NetworkManager {
    static let shared   = NetworkManager()
    let decoder         = JSONDecoder()

    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    
    func getCountries(completed: @escaping (Result<[Country], FDCIError>) -> Void) {
        let endpoint = "https://restcountries.com/v3.1/all"
        
        guard let url = URL(string: endpoint) else {
            //completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                print(error)
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completed(.failure(.invalidResponse))
                return
            }

            switch response.statusCode {
            case 200:
                break // Success, proceed with data parsing
            case 408, 504: // Timeout-related errors
                completed(.failure(.invalidResponse))
                return
            default:
                print("Unexpected status code: \(response.statusCode)") // Log unexpected status codes
                completed(.failure(.invalidResponse))
                return
            }
            /*
            guard let response = response as?  HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            */
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Country].self, from: data)
                completed(.success(followers))
            }catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
        
    }
     

}
