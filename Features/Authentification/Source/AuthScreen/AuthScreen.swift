//
//  AuthScreen.swift
//  Authentification
//
//  Created by Ivan on 27.05.2024.
//

import SwiftUI
import AppUI

struct AuthScreen<ViewModel: AuthScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel

    @State private var isSecure: Bool = true

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Авторизация")
                    .font(.largeTitle)
                    .bold()
                
                AppUIAsset.Assets.account.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250, alignment: .top)
                    .padding(.bottom, 50)
                
                TSATextField(placeholder: "Имя пользователя", value: $viewModel.name)
        
                TSASecureTextField(value: $viewModel.password, isSecure: $isSecure, placeholder: "Пароль")
                
                

                TSANavigationLink(placeholder: "Войти", destination: viewModel.openMain())
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    AuthScreen(viewModel: EmptyAuthViewModel())
}
