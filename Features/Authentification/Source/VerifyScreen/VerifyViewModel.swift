//
//  VerifyViewModel.swift
//  Authentification
//
//  Created by Ivan on 27.05.2024.
//

import Foundation
import Common
import Platform

protocol VerifyViewModelProtocol: BaseViewModelProtocol {
    var remainingTime: Int { get }
    
    func startTimer()
    func stopTimer()
    func sendNewCode()
    func redeemCode()
}

final class VerifyViewModel: BaseViewModel, VerifyViewModelProtocol {
    
    @Published var remainingTime: Int = 0
    private var timerTask: Task<Void, Never>?
    private var service: AuthServiceProtocol
    var router: AuthRouter?
    
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    
    func startTimer() {
//        timerTask?.cancel()
//         
//        timerTask = Task { [weak self] in
//            guard let self = self else { return }
//            
//            while self.remainingTime > 0 {
//                try? await Task.sleep(nanoseconds: 1_000_000_000)
//                
//                self.remainingTime -= 1
//                print(remainingTime)
//            }
//        }
     }
    
    func stopTimer() {
        timerTask?.cancel()
        timerTask = nil
    }
     
     func sendNewCode() {
         remainingTime = 120
         startTimer()
     }
    
    func redeemCode() {
        service.setLogStatus(status: true)
    }
}
