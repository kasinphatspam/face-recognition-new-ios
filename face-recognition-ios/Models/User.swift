//
//  UserModel.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import Foundation

struct UsersResponse: Decodable {
    let results: [User]
}

struct User: Codable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let email: String
    let gender: String?
    let image: String?
    let organization: Organization?
    let role: Role?
    
    func getFullName() -> String? {
        return "\(firstname) \(lastname)"
    }
}
