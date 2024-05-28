//
//  SecureTextField.swift
//  AppUI
//
//  Created by Ivan on 27.05.2024.
//

import SwiftUI

public struct TSASecureTextField: View {
    @Binding private var value: String
    @Binding private var isSecure: Bool
    private var placeholder: String
    
    public init(value: Binding<String>, isSecure: Binding<Bool>, placeholder: String) {
        self._value = value
        self._isSecure = isSecure
        self.placeholder = placeholder
    }
    
    public var body: some View {
        HStack {
            if isSecure {
                SecureField(placeholder, text: $value)
                    .padding(10)
            } else {
                TextField(placeholder, text: $value)
                    .padding(10)
            }
            
            Button(action: {
                isSecure.toggle()
            }) {
                Text(isSecure ? "Показать" : "Скрыть")
                    .foregroundColor(.green)
            }
            .padding(.trailing, 10)
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
        .font(.system(size: 16, weight: .regular, design: .default))
    }
}

#Preview {
    TSASecureTextField(value: .constant(""), isSecure: .constant(true), placeholder: "")
}
