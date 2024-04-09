//
//  GigaChatApp.swift
//  GigaChat
//
//  Created by Ivan on 29.12.2023.
//

import SwiftUI

@main
struct GigaChatApp: App {
    let container = MainContainer()
    
    var body: some Scene {
        WindowGroup {
            container.auth()
        }
    }
}
