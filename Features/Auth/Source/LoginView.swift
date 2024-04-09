//
//  LoginView.swift
//  Auth
//
//  Created by Ivan on 10.04.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
        @State private var password: String = ""
        @State private var isPasswordVisible: Bool = false
        
        var body: some View {
            VStack(spacing: 20) {
                Text("Авторизация")
                    .font(.largeTitle)
                    .bold()
                
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
                        Text(isPasswordVisible ? "Скрыть" : "Show")
                            .foregroundColor(.blue)
                    }
                }
                .textFieldStyle(.roundedBorder)
                
                Spacer()

                Button(action: {
                    
                }) {
                    Text("Авторизоваться")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                Button(action: {
                   
                }) {
                    Text("Забыли свой пароль?")
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
            .padding()
        }
}

#Preview {
    LoginView()
}
