//
//  CustomButton.swift
//  AppUI
//
//  Created by Ivan on 27.05.2024.
//

import SwiftUI

public struct CustomButton: View {
    
    private var placeholder: String
    private var perform: () -> Void
    
    public init(placeholder: String, perform: @escaping () -> Void) {
        self.placeholder = placeholder
        self.perform = perform
    }
    
    public var body: some View {
        Button {
            perform()
        } label: {
            Text(placeholder)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(30)
        }
    }
}

#Preview {
    CustomButton(placeholder: "dwadaw", perform: {})
}
