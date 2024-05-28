//
//  NetworkManager.swift
//  GigaChat
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import Common

public protocol NetworkManager {
    func request<Request: DataRequest>(_ request: Request, allowRetry: Bool) async throws -> Request.Response
    func webScoketRequest<Request: WebSocketRequest>(_ request: Request) async throws -> Request.Response
}


public class DefaultNetworkManager: NetworkManager  {
    
    private let provider: HTTPClient
    
    public init() {
        self.provider = HTTPClient()
    }

    public func request<Request: DataRequest>(_ request: Request, allowRetry: Bool = true) async throws -> Request.Response {
        
        let result = try await provider.request(request, allowRetry: true)
        switch result {
        case .success(let value):
            return value
        case .failure(let applicationError):
            throw applicationError
        }
    }
    
    public func webScoketRequest<Request: WebSocketRequest>(_ request: Request) async throws -> Request.Response {
        let result = try await provider.requestSocket(request)
        switch result {
        case .success(let value):
            return value
        case .failure(let applicationError):
            throw applicationError
        }
    }
}


public class HTTPClient {
    private var session: URLSession
    private var webSocketTask: URLSessionWebSocketTask?

    public init() {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        session = URLSession(configuration: config)
    }
    
    public func request<Request>(_ request: Request, allowRetry: Bool = true) async throws -> Result<Request.Response, NetworkError> where Request : DataRequest  {
        var (data, response): (Data, URLResponse)

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
        
        (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else { return .failure(NetworkError.httpRequestNotFound) }

        if response.statusCode == 401 {
            let error = NetworkError.invalidToken(reason: "Код 401 invalid token")
            return .failure(error)
        }
        
        guard (200...299).contains(response.statusCode) else {
            let error = NetworkError.httpErrorWithServer
            return .failure(error)
        }
        
        let decodedResponse = try request.decode(data)
        return .success(decodedResponse)
    }
    
    public func requestSocket<Request>(_ request: Request) async throws -> Result<Request.Response, NetworkError> where Request: WebSocketRequest {
            guard let url = URL(string: request.url) else {
                throw NSError(domain: "InvalidEndpoint", code: 404)
            }

            webSocketTask = session.webSocketTask(with: url)
            webSocketTask?.resume()

            let message = URLSessionWebSocketTask.Message.string(request.message)
            try await webSocketTask?.send(message)

            let response = try await receiveMessage()
            let decodedResponse = try request.decode(response)
            return .success(decodedResponse)
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
