//
//  API.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 29/12/2566 BE.
//

import Foundation

class ConnectionHelper {
    
    private var url: String
    
    init() {
        self.url = EnviromentVariable.url
    }
    
    func login() -> String {             return "\(url)/auth/login" }
    
    func register() -> String {          return "\(url)/auth/register" }
    
    func me() -> String {                return "\(url)/auth/me" }
    
    func leaveOrg() -> String {          return "\(url)/user/organization/exit" }
    
    func train(id: Int) -> String {      return "\(url)/organizations/info/contacts/\(id)/encode" }
    
    func recognize() -> String {         return "\(url)/organizations/info/contacts/recognition" }
    
    func getOrgById(id: Int) -> String { return "\(url)/organizations/\(id)" }
    
    func employee() -> String {          return "\(url)/organizations/info/employees"}
    
    func contact() -> String {           return "\(url)/organizations/info/contacts"}
    
    func join(code: String) -> String {  return "\(url)/organizations/join/\(code)"}
    
}
