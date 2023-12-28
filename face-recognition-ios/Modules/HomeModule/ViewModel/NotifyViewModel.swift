//
//  NotifyViewModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 22/12/2566 BE.
//

import Foundation

class NotifyViewModel: ObservableObject {
    
    var notifications: Observable<[Notification]> = Observable(nil)
    
    func fetch() async throws {
        
    }
}
