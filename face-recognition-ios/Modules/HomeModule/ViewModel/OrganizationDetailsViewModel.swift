//
//  OrganizationDetailsViewModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import Foundation


class OrganizationDetailsViewModel: ObservableObject {
    
    func fetch() -> Organization? {
        return GlobalVariables.user?.organization
    }
}
