//
//  AnalyzeRepository.swift
//  Platform
//
//  Created by Ivan on 27.05.2024.
//

import Foundation

public protocol AnalyzeRepositoryProtocol: AnyObject {
    func analyze(_ dataset: Data, method: String, parameters: [String: String]) async throws
    func getAllMethods() async throws -> [String]
    func getAnalyzeHistory() async throws -> [String]
}

final class  AnalyzeRepository: BaseRepository {}

extension  AnalyzeRepository: AnalyzeRepositoryProtocol {
    func analyze(_ dataset: Data, method: String, parameters: [String : String]) async throws {
        
    }
    
    func getAllMethods() async throws -> [String] {
        return []
    }
    
    func getAnalyzeHistory() async throws -> [String] {
        return []
    }
}
