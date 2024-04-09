//
//  NetworkManager.swift
//  GigaChat
//
//  Created by Ivan on 29.12.2023.
//

import Foundation

public protocol NetworkManager {
    func request<Request: DataRequest>(_ request: Request) async throws -> Request.Response
}

public class DefaultNetworkManager: NetworkManager {
    private var session: URLSession
    
    public init() {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        session = URLSession(configuration: config)
    }
    
    public func request<Request>(_ request: Request) async throws -> Request.Response where Request : DataRequest {
        
        guard var urlComponent = URLComponents(string: request.url) else {
            let error = NSError(domain: "InvalidEndpoint", code: 404)
            throw NSError(domain: "A", code: 1)
        }
        
        var queryItems: [URLQueryItem] = []
        
        for (key, value) in request.queryItems {
            let urlQueryItem = URLQueryItem(name: key, value: value)
            urlComponent.queryItems?.append(urlQueryItem)
            queryItems.append(urlQueryItem)
        }
        
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            throw NSError(domain: "InvalidEndpoint", code: 404)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        do {
            let (data, _) = try await session.data(for: urlRequest)
            let decodedReponse = try request.decode(data)
            
            return decodedReponse
        } catch {
            throw NSError(domain: "B", code: 2)
        }
    }
}
