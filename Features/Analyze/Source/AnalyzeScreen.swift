//
//  ProfileView.swift
//  Profile
//
//  Created by Ivan on 10.04.2024.
//

import SwiftUI
import AppUI

struct AnalyzeScreen<ViewModel: AnalyzeViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    @State private var showingFilePicker = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Text("Анализ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                Text("Прикрепите датасет")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Нажмите кнопку “Загрузить”, чтобы прикрепить ваш датасет и отправить его на анализ")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer()
        
                TSAButton(placeholder: "Загрузить") {
                    showingFilePicker = true
                }
            }
            .padding()
            .fileImporter(
                       isPresented: $showingFilePicker,
                       allowedContentTypes: [.image],
                       allowsMultipleSelection: false
                   ) { result in
                       switch result {
                       case .success(let urls):
                           if let url = urls.first {
                               viewModel.attachFile(url)
                           }
                       case .failure(let error):
                           print("File import failed: \(error.localizedDescription)")
               }
           }
        }
    }
}

#Preview {
    AnalyzeScreen(viewModel: EmptyAnalyzeViewModel())
}
