//
//  CodeInputView.swift
//  AppUI
//
//  Created by Ivan on 27.05.2024.
//

import SwiftUI

public struct TSACodeInputView: View {
    @State private var code: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?
    
    public init() {}
    
    public var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<6) { index in
                TextField("", text: $code[index])
                    .frame(width: 50, height: 50)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: index)
                    .onChange(of: code[index]) { newValue in
                        if newValue.count > 1 {
                            code[index] = String(newValue.prefix(1))
                        }
                        if newValue.count == 1 {
                            if index < 5 {
                                focusedField = index + 1
                            } else {
                                focusedField = nil
                            }
                        }
                    }
            }
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.focusedField = 0
            }
        }
    }
}


#Preview {
    TSACodeInputView()
}
