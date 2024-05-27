//
//  MainView.swift
//  TSA
//
//  Created by Ivan on 27.05.2024.
//

import SwiftUI
import Swinject

struct MainView: View {
    
    let container: MainContainer
    
    var body: some View {
        TabView {
            container.analyze()
            .tabItem {
                Text("Aboba")
            }
            VStack {
                
            }
            .tabItem {
                Text("Biba")
            }
        }
    }
}

