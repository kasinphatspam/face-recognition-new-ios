//
//  ManageOrganizationViewModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 26/12/2566 BE.
//

import Foundation

class ManageOrganizationViewModel: ObservableObject {
    
    private let organizationService: OrganizationService = OrganizationService()
    private let userService: UserService = UserService()
    var signal: Observable<Signals> = Observable(nil)
    var organization: Observable<Organization> = Observable(nil)
    
    func fetch() async throws {
        let organizationId = GlobalVariables.user?.organization?.id
        if organizationId == nil {
            return
        }
        try await organizationService.getOrganizationById(id: organizationId!) {
            error, success, data in
            
            if error != nil {
                return 
            }
            
            if success {
                self.organization.value = data
            }
            
        }
    }
    
    
    func getCurrentUser() -> User? {
        return GlobalVariables.user
    }
    func leaveOrganization() {
        Task {
            try await userService.exitOrganization() {
                error, success in
                if error != nil {
                    return
                }
                
                if success {
                    self.signal.value = Signals(command: "LEAVE_AN_ORGANIZATION_SUCCESS")
                }
            }
        }
    }
}
