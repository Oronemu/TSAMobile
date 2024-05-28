//
//  RepositoryError.swift
//  Common
//
//  Created by Ivan on 28.05.2024.
//

import Foundation

public enum RepositoryError {
    
    case archiveStreamNotExist
    case noDataFound
    
}

extension RepositoryError: ApplicationError {
    
    public var title: String {
        switch self {
        case .archiveStreamNotExist:
            return "Архив не найден"
        case .noDataFound:
            return "Данные не получены"
        }
    }
    
    public var code: Int {
        switch self {
        case .archiveStreamNotExist:
            return -10100
        case .noDataFound:
            return -10101
        }
    }
    
    public var message: String {
        switch self {
        case .archiveStreamNotExist:
            return "Архив не найден"
        case .noDataFound:
            return "Данные не получены"
        }
    }
    
    public var extra: Detail? {
        return nil
    }
}
