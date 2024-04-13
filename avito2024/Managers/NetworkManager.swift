//
//  NetworkManager.swift
//  avito2024
//
//  Created by DIMbI4 on 04.04.2024.
//

import Foundation
import SystemConfiguration

protocol NetworkManagerProtocol {
    
    func searchItems(searchItemsParameters: SearchItemsParameters, completionHandler: @escaping (Result<Items, NetworkManagerError>) -> Void)
    func fetchItemImage(url: URL, completionHandler: @escaping (Result<Data, NetworkManagerError>) -> Void)
    
}

final class NetworkManager: NetworkManagerProtocol {
    
    private var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "itunes.apple.com"
        return urlComponents
    }
    
    func searchItems(searchItemsParameters: SearchItemsParameters, completionHandler: @escaping (Result<Items, NetworkManagerError>) -> Void) {
        
        guard isConnectedToInternet() else {
            completionHandler(.failure(.noInternetConnection))
            return
        }
        
        var urlComponents = self.urlComponents
        urlComponents.path = "/search"
        urlComponents.queryItems = searchItemsParameters.getParameters().map({ URLQueryItem(name: $0.key, value: $0.value) })
        
        guard let url = urlComponents.url else {
            completionHandler(.failure(.createURLFailed))
            return
        }
        
        print(url)
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        
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
    
    func fetchItemImage(url: URL, completionHandler: @escaping (Result<Data, NetworkManagerError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completionHandler(.failure(.requestFailed))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(.statusCodeFailed))
                return
            }
            
            if let data = data {
                completionHandler(.success(data))
            } else {
                completionHandler(.failure(.getDataFailed))
            }
            
        }.resume()
    }
    
    private func isConnectedToInternet() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return isReachable && !needsConnection
    }
    
}
