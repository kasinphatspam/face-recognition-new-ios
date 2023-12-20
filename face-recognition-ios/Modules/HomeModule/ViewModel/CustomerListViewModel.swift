//
//  CustomerListViewModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import Foundation

class CustomerListViewModel: ObservableObject {
    
    private let organizationService: OrganizationService = OrganizationService()
    var contacts: Observable<[Contact]> = Observable(nil)
    
    func fetch() async throws {
        if GlobalVariables.user != nil && GlobalVariables.user?.organization != nil {
            try await organizationService.getAllContact(
                id: GlobalVariables.user!.organization!.id)
            {
                error, success, data in
                
                self.contacts.value = data
            }
        }
    }
}
