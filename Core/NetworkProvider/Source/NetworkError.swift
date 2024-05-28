//
//  NetworkError.swift
//  Common
//
//  Created by Ivan on 28.05.2024.
//

import Foundation
import Common

public enum NetworkError {
    
    case httpResponseConvertation
    case httpRequestNotFound
    case httpErrorWithRest(code: Int, detail: Detail)
    case httpErrorWithServer
    case tokenNotFound
    case invalidToken(reason: String)
}

extension NetworkError: ApplicationError {

    public var title: String {
        return "Ошибка сети"
    }
    
    public var code: Int {
        switch self {
        case .httpRequestNotFound:
            return -10002
        case .httpResponseConvertation:
            return -10001
        case .invalidToken, .tokenNotFound:
            return -10003
        case .httpErrorWithServer:
            return -10004
        case .httpErrorWithRest(code: let code, detail: _):
            return code

        }
    }
    
    public var message: String {
        return "Ошибка сети"
    }
    
    public var detail: Detail? {
        switch self {
        case .httpErrorWithRest(code: _, detail: let detail):
            return Detail(message: detail.message)
        default:
            return nil
        }
    }
}
