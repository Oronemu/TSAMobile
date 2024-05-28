//
//  VerifyScreen.swift
//  Auth
//
//  Created by Ivan on 10.04.2024.
//

import SwiftUI
import AppUI

struct VerifyScreen<ViewModel: VerifyViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                                
                Text("Подтверждение")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()

                Text("Введи код подтверждения, отправленный на указанную электронную почту")
                    .foregroundStyle(.gray)
                
                TSACodeInputView()
                
                Text("Отправить повторно через \(viewModel.remainingTime) секунд")
                
                TSAButton(placeholder: "Подтвердить") {
                    viewModel.redeemCode()
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                viewModel.sendNewCode()
            }
            .onDisappear{
                viewModel.stopTimer()
            }
        }
    }
}

#Preview {
    VerifyScreen(viewModel: EmptyVerifyViewModel())
}
