//
//  ChatsScreen.swift
//  GigaChat
//
//  Created by Ivan on 29.12.2023.
//

import SwiftUI
import AppUI

struct RegistryScreen<ViewModel: RegistryScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true

    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Регистрация")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()

                CustomTextField(placeholder: "Имя пользователя", value: $name)
        
                SecureTextField(value: $password, isSecure: $isSecure, placeholder: "Пароль")

                CustomTextField(placeholder: "Электронная почта", value: $email)
                    .keyboardType(.emailAddress)
                        
                CustomNavigationLink(placeholder: "Далее", destination: viewModel.openVerify())
                
                NavigationLink(destination: viewModel.openAuth()) {
                    Text("Уже зарегистрированы?")
                }
                            
                Spacer()
            }
            .padding()
        }
    }
}

extension RegistryScreen {
    func register(name: String, email: String, password: String) {
        Task {
            try await viewModel.register(username:name, email: email, password: password)
        }
    }
}

#Preview {
    RegistryScreen(viewModel: EmptyRegistryViewModel())
}
