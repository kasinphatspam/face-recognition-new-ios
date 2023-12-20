//
//  EmployeeListViewModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import Foundation

class EmployeeListViewModel: ObservableObject {
    
    private let organizationService: OrganizationService = OrganizationService()
    var users: Observable<[User]> = Observable(nil)
    
    func fetch() async throws{
        if GlobalVariables.user != nil && GlobalVariables.user?.organization != nil {
            try await organizationService.getAllEmployee(
                id: GlobalVariables.user!.organization!.id)
            {
                error, success, data in
                
                self.users.value = data
            }
        }
    }
    
}
