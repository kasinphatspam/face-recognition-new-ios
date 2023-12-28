//
//  CustomerDetailsViewModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import Foundation

class AddCustomerViewModel: ObservableObject {
    
    private let organizationService: OrganizationService = OrganizationService()
    var signal: Observable<Signals> = Observable(nil)
    
    func add(title: String,
             email: String,
             firstname: String,
             lastname: String,
             mobile: String,
             lineId: String,
             facebook: String,
             customerCompany: String
    ) async throws {
        try await organizationService.addNewContact(
            title: title,
            email: email,
            firstname: firstname,
            lastname: lastname,
            mobile: mobile,
            lineId: lineId,
            facebook: facebook,
            customerCompany: customerCompany
        ) {
            error, success in
            
            if success {
                self.signal.value = Signals(command: "ADD_CUSTOMER_SUCCESS")
            }
        }
    }
    
}
