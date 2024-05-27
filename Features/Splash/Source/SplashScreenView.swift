//
//  SplashScreenView.swift
//  TSA
//
//  Created by Ivan on 24.04.2024.
//

import SwiftUI

struct SplashScreenView<ViewModel: SplashScreenViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Грузим")
        }
        .task {
            viewModel.login()
        }
    }
}

#Preview {
    SplashScreenView(viewModel: EmptySplashScreenViewModel())
}
