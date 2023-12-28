import Foundation

struct OrganizationResponse: Codable {
    let message: String
}

class OrganizationService {
    
    private let connectionHelper = ConnectionHelper()
    
    // MARK: - Public Methods
    
    func getOrganizationById(id: Int, completion: @escaping (Error?, Bool, Organization?) -> Void) async throws {
        let connection = Connection(url: connectionHelper.getOrgById(id: id))
        try await connection.get(headers: ["session": GlobalVariables.session]) { error, status, data in
            guard let data = data, error == nil else {
                completion(error, false, nil)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode(Organization.self, from: data) else {
                print("OrganizationService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                completion(JSONDecoderError.decodeFailure, false, nil)
                return
            }
            
            print("OrganizationService: Fetch organization id: \(decoded.id)")
            completion(nil, true, decoded)
        }
    }
    
    func join(code: String, completion: @escaping (Error?, Bool) -> Void) async throws {
        let connection = Connection(url: connectionHelper.join(code: code))
        try await connection.post(body: nil, headers: ["session": GlobalVariables.session]) { error, status, data in
            guard let data = data, error == nil else {
                completion(error, false)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode(OrganizationResponse.self, from: data) else {
                print("OrganizationService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                completion(JSONDecoderError.decodeFailure, false)
                return
            }
            
            print("OrganizationService: \(decoded.message)")
            completion(nil, true)
        }
    }
    
    func getAllEmployee(id: Int, completion: @escaping (Error?, Bool, [User]?) -> Void) async throws {
        let connection = Connection(url: connectionHelper.employee())
        try await connection.get(headers: ["session": GlobalVariables.session]) { error, success, data in
            guard let data = data, error == nil else {
                completion(error, false, nil)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode([User].self, from: data) else {
                print("OrganizationService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                completion(JSONDecoderError.decodeFailure, false, nil)
                return
            }
            
            print("OrganizationService: Retrieve all employee in organization id: \(id)")
            completion(nil, true, decoded)
        }
    }
    
    func getAllContact(id: Int, completion: @escaping (Error?, Bool, [Contact]?) -> Void) async throws {
        let connection = Connection(url: connectionHelper.contact())
        try await connection.get(headers: ["session": GlobalVariables.session]) { error, status, data in
            guard let data = data, error == nil else {
                completion(error, false, nil)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode([Contact].self, from: data) else {
                print("OrganizationService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                completion(JSONDecoderError.decodeFailure, false, nil)
                return
            }
            
            print("OrganizationService: Retrieve all contact in organization id: \(id)")
            completion(nil, true, decoded)
        }
    }
    
    func addNewContact(
        title: String, email: String, firstname: String, lastname: String, mobile: String,
        lineId: String, facebook: String, customerCompany: String,
        completion: @escaping (Error?, Bool) -> Void
    ) async throws {
        let body = [
            "title": title, "email1": email, "firstname": firstname, "lastname": lastname,
            "mobile": mobile, "lineId": lineId, "facebook": facebook, "contactCompany": customerCompany
        ]
        
        let connection = Connection(url: connectionHelper.contact())
        try await connection.post(body: body, headers: ["session": GlobalVariables.session]) { error, status, data in
            if error != nil {
                completion(error, false)
                return
            }
            
            guard let _ = try? JSONDecoder().decode(OrganizationResponse.self, from: data!) else {
                print("OrganizationService: Error decode failure \(String(decoding: data!, as: UTF8.self))")
                completion(JSONDecoderError.decodeFailure, false)
                return
            }
            
            print("OrganizationService: Add new contact success")
            completion(nil, true)
            
            if status {
                completion(error, true)
            }
        }
    }
}
