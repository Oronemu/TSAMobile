//
//  NetworkManager.swift
//  GigaChat
//
//  Created by Ivan on 29.12.2023.
//

import Foundation

public protocol NetworkManager {
    func request<Request: DataRequest>(_ request: Request) async throws -> Request.Response
    func requestSocket<Request: WebSocketRequest>(_ request: Request) async throws -> Request.Response
}

public class DefaultNetworkManager: NetworkManager {
    private var session: URLSession
    private var webSocketTask: URLSessionWebSocketTask?

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
    
    public func requestSocket<Request>(_ request: Request) async throws -> Request.Response where Request: WebSocketRequest {
            guard let url = URL(string: request.url) else {
                throw NSError(domain: "InvalidEndpoint", code: 404)
            }

            webSocketTask = session.webSocketTask(with: url)
            webSocketTask?.resume()

            let message = URLSessionWebSocketTask.Message.string(request.message)
            try await webSocketTask?.send(message)

            let response = try await receiveMessage()
            let decodedResponse = try request.decode(response)
            return decodedResponse
        }

    private func receiveMessage() async throws -> Data {
        guard let webSocketTask = webSocketTask else {
            throw NSError(domain: "WebSocketError", code: 3)
        }

        let result = try await webSocketTask.receive()
        switch result {
        case .data(let data):
            return data
        case .string(let text):
            return Data(text.utf8)
        @unknown default:
            throw NSError(domain: "WebSocketError", code: 4)
        }
    }
}
