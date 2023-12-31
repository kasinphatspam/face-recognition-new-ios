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
    let codeCreatedTime: String?
    let packageKey: String?
    let plan: Plan?
    let employeeCount: Int?
    let contactCount: Int?
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

struct Plan: Codable {
    let id: Int
    let title: String
    let cost: Float
    let limitEmployee: Int
    let limitContact: Int
    let features: String?
}

