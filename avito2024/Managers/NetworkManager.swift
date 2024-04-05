//
//  NetworkManager.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import Foundation

protocol NetworkManagerProtocol {
    
    func searchItems(itemParameters: ItemParameters, completionHandler: @escaping (Result<Items, NetworkManagerError>) -> Void)
    
}

final class NetworkManager: NetworkManagerProtocol {
    
    private var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "itunes.apple.com"
        return urlComponents
    }
    
    func searchItems(itemParameters: ItemParameters, completionHandler: @escaping (Result<Items, NetworkManagerError>) -> Void) {
        
        var urlComponents = self.urlComponents
        urlComponents.path = "/search"
        urlComponents.queryItems = itemParameters.getParameters().map({ URLQueryItem(name: $0.key, value: $0.value) })

        guard let url = urlComponents.url else {
            completionHandler(.failure(.createURLFailed))
            return
        }
        
        print(url)
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ = error {
                completionHandler(.failure(.requestFailed))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(.statusCodeFailed))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            if let data = data, let items = try? jsonDecoder.decode(Items.self, from: data) {
                completionHandler(.success(items))
            } else {
                completionHandler(.failure(.getDataFailed))
            }

        }.resume()
    }
    
}
