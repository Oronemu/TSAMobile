//
//  CustomTextField.swift
//  AppUI
//
//  Created by Ivan on 27.05.2024.
//

import SwiftUI

public struct CustomTextField: View {
    
    var placeholder: String
    @Binding var value: String
    
    public init(placeholder: String, value: Binding<String>) {
        self.placeholder = placeholder
        self._value = value
    }
    
    public var body: some View {
        TextField(placeholder, text: $value)
            .padding(10)
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
    CustomTextField(placeholder: "Имя", value: .constant(""))
}
