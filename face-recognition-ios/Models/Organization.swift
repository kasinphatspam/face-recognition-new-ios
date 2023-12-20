//
//  Organization.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import Foundation

struct Organization: Codable {
    let id: Int
    let name: String
    let passcode: String
}

struct Role: Codable {
    let id: Int
    let name: String
}

struct Contact: Codable, Identifiable {
    let id: Int
    let firstname: String
    let lastname: String
    let company: String?
    let title: String?
    let officePhone: String?
    let mobile: String?
    let email1: String?
    let email2: String?
    let dob: String?
    let owner: String?
    let createdTime: String
    let modifiedTime: String
    let lineId: String?
    let facebook: String?
    let linkedin: String?
    let encodedId: String?
    let image: String?
}

