//
//  AccountCenterViewModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import Foundation

class AccountCenterViewModel: ObservableObject {
    
    private let authService: AuthService = AuthService()
    func logout() {
        authService.logout()
    }
}
