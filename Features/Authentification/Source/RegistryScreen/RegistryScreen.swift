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
    @State private var isSecure: Bool = true
    
    var body: some View {
        NavigationStack {
            if let error = viewModel.errorMessage {
                TSAErrorView(description: error)
            } else {
                VStack(spacing: 20) {
                    
                    Text("Регистрация")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()

                    VStack(spacing: 10) {
                        TSATextField(placeholder: "Имя пользователя", value: $viewModel.profile.username)
                
                        TSASecureTextField(value: $viewModel.profile.password, isSecure: $isSecure, placeholder: "Пароль")

                        TSATextField(placeholder: "Электронная почта", value: $viewModel.profile.email)
                            .keyboardType(.emailAddress)
                        
                        TSATextField(placeholder: "ФИО", value: $viewModel.profile.fullName)
                        
                        TSATextField(placeholder: "Номер телефона", value: $viewModel.profile.phoneNumber)
                            .keyboardType(.phonePad)
                    }
                            
                    TSANavigationLink(placeholder: "Далее", destination: viewModel.openVerify())
                    
                    NavigationLink(destination: viewModel.openAuth()) {
                        Text("Уже зарегистрированы?")
                    }
                                
                    Spacer()
                }
            }
        }
        .padding()
    }
}

#Preview {
    RegistryScreen(viewModel: EmptyRegistryViewModel())
}
