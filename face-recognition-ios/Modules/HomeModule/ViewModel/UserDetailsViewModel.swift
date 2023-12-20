//
//  UserDetailsViewModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import Foundation

class UserDetailsViewModel: ObservableObject {
    
    func fetch() -> User? {
        return GlobalVariables.user
    }
}
