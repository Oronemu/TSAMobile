//
//  TSAErrorView.swift
//  AppUI
//
//  Created by Ivan on 28.05.2024.
//

import SwiftUI

public struct TSAErrorView: View {
    
    var description: String? = nil
    
    public init(description: String? = nil) {
        self.description = description
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            // Emoji Image
            Text("😔")
                .font(.system(size: 100))
            
            // Error Title
            Text("Упс, ошибка!")
                .font(.title)
                .fontWeight(.bold)
            
            // Error Description
            Text(description ?? "Во время обработки возникла ошибка, попробуйте еще раз.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Additional Message
            Text("Если проблема повторится, то обратитесь в службу технической поддержки")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    TSAErrorView()
}
