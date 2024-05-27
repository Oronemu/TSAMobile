//
//  ProfileView.swift
//  Profile
//
//  Created by Ivan on 10.04.2024.
//

import SwiftUI

struct MainScreen<ViewModel: MainScreenViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        TabView {
            viewModel.openAnalyzeScreen()
                .tabItem {
                VStack {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Анализ")
                }
            }
            viewModel.openAnalyzeScreen()
                .tabItem {
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Профиль")
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainScreen(viewModel: EmptyMainScreenViewModel())
}
