//
//  BaseRepository.swift
//  Core
//
//  Created by Ivan on 29.12.2023.
//

import Foundation
import NetworkProvider

public class BaseRepository {
    internal var networkManager: NetworkManager!
    internal var dataBaseManager: DataBaseManager!
    
    public convenience init(network: NetworkManager, database: DataBaseManager) {
        self.init()
        self.networkManager = network
        self.dataBaseManager = dataBaseManager
    }
}
