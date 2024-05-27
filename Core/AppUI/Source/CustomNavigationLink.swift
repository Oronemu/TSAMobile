//
//  CustomnavigationLink.swift
//  AppUI
//
//  Created by Ivan on 27.05.2024.
//

import SwiftUI

public struct CustomNavigationLink<Destination: View>: View {
    
    private var placeholder: String
    private var destination: Destination
    
    public init(placeholder: String, destination: Destination) {
        self.placeholder = placeholder
        self.destination = destination
    }
    
    public var body: some View {
        NavigationLink(destination: destination) {
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
    CustomNavigationLink(placeholder: "", destination: EmptyView())
}
