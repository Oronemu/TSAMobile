//
//  ChatsScreen.swift
//  GigaChat
//
//  Created by Ivan on 29.12.2023.
//

import SwiftUI

struct AuthScreen<ViewModel: AuthScreenViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                        Text("Регистрация")
                            .font(.largeTitle)
                            .bold()
                        
                        TextField("Имя", text: $name)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Электронная почта", text: $email)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        HStack {
                            if isPasswordVisible {
                                TextField("Пароль", text: $password)
                            } else {
                                SecureField("Пароль", text: $password)
                            }
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Text(isPasswordVisible ? "Скрыть" : "Показать")
                            }
                        }
                        .textFieldStyle(.roundedBorder)
                        
                        Spacer()

                        Button(action: {
                            
                        }) {
                            Text("Далее")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                
                        NavigationLink(destination: LoginView()) {
                            Text("Уже зарегистрированы?")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                        }
                        
                        Spacer()
                    }
                    .padding()
        }
    }
}

extension AuthScreen {
    func register() {
        Task {
          
            
        }
    }
    
    func login() {
        Task {
            
        }
    }
    
    func changePassword() {
        Task {
            
        }
    }
}

#Preview {
    AuthScreen(viewModel: EmptyConverterViewModel())
}
