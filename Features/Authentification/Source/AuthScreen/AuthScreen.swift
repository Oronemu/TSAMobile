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

    @State private var name: String = ""
    @State private var password: String = ""
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
                
                CustomTextField(placeholder: "Имя пользователя", value: $name)
        
                SecureTextField(value: $password, isSecure: $isSecure, placeholder: "Пароль")
                
                

                CustomNavigationLink(placeholder: "Войти", destination: viewModel.openMain())
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    AuthScreen(viewModel: EmptyAuthViewModel())
}
