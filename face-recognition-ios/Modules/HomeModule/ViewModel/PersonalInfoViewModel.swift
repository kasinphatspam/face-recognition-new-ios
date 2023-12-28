//
//  PersonalInfoViewModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 22/12/2566 BE.
//

import Foundation

class PersonalInfoViewModel: ObservableObject {
    
    func fetch() -> User? {
        return GlobalVariables.user
    }
}
