import Foundation

struct AuthResponse: Codable {
    let message: String
    let session: String
}

enum JSONDecoderError: Error {
    case decodeFailure
}

class AuthService {
    
    private var session: String? = nil
    private var user: User? = nil
    
    private let connectionHelper = ConnectionHelper()
    
    // MARK: - Public Methods
    
    func getCurrentUser(completion: @escaping (Error?, Bool, User?) -> Void) async throws {
        guard let session = read() else {
            completion(nil, false, nil)
            return
        }
        
        self.session = session
        GlobalVariables.session = session
        
        let connection = Connection(url: connectionHelper.me())
        try await connection.get(headers: ["session": session]) { error, status, data in
            guard let data = data, error == nil else {
                completion(nil, false, nil)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode(User.self, from: data) else {
                print("AuthService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                completion(JSONDecoderError.decodeFailure, false, nil)
                return
            }
            
            print("AuthService: Fetch user id: \(decoded.id)")
            self.user = decoded
            GlobalVariables.user = decoded
            completion(nil, true, decoded)
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Error?, Bool, String?) -> Void) async throws {
        let body = [
            "email": email,
            "password": password
        ]
        
        let connection = Connection(url: connectionHelper.login())
        try await connection.post(body: body, headers: nil) { error, status, data in
            guard let data = data, error == nil else {
                completion(error, false, nil)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode(AuthResponse.self, from: data) else {
                completion(JSONDecoderError.decodeFailure, false, nil)
                print("AuthService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                return
            }
            
            self.session = decoded.session
            self.write(token: decoded.session)
            GlobalVariables.session = decoded.session
            completion(nil, true, decoded.session)
            print("AuthService: Login successfully by session id: \(self.session!.prefix(6))######...")
        }
    }
    
    func logout() {
        delete()
        session = nil
        user = nil
        GlobalVariables.session = ""
    }
    
    func register(email: String, password: String, firstname: String, lastname: String, personalId: String, completion: @escaping (Error?, Bool, String?) -> Void) async throws {
        let body = [
            "email": email,
            "password": password,
            "firstname": firstname,
            "lastname": lastname,
            "personalId": personalId
        ]
        
        let connection = Connection(url: connectionHelper.register())
        try await connection.post(body: body, headers: nil) { error, status, data in
            guard let data = data, error == nil else {
                completion(error, false, nil)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode(AuthResponse.self, from: data) else {
                completion(JSONDecoderError.decodeFailure, false, nil)
                print("AuthService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                return
            }
            
            self.session = decoded.session
            self.write(token: decoded.session)
            GlobalVariables.session = decoded.session
            completion(nil, true, decoded.session)
            print("AuthService: Register successfully by session id: \(self.session!.prefix(6))######...")
        }
    }
    
    func forgotPassword(email: String) {
        // Implementation for forgotPassword
    }
    
    // MARK: - Keychain
    
    private func write(token: String) {
        guard let data = token.data(using: .utf8) else {
            print("AuthService: Failed to convert token to data")
            return
        }
        
        let service = EnviromentVariable.service
        let account = EnviromentVariable.account
        
        if KeychainHelper.storeDate(data: data, forService: service, account: account) {
            print("AuthService: Data stored in keychain successfully")
        } else {
            print("AuthService: Failed to store data in keychain")
            if KeychainHelper.updateData(data: data, forService: service, account: account) {
                print("AuthService: Update data in keychain")
            } else {
                print("AuthService: Failed to update data in keychain")
            }
        }
    }
    
    private func read() -> String? {
        let service = EnviromentVariable.service
        let account = EnviromentVariable.account
        var session: String? = nil
        
        if let retrivedData = KeychainHelper.retrivedData(forService: service, account: account) {
            session = String(decoding: retrivedData, as: UTF8.self)
        } else {
            session = nil
            print("AuthService: Failed to retrieve data from keychain")
        }
        
        return session
    }
    
    private func delete() {
        let service = EnviromentVariable.service
        let account = EnviromentVariable.account
        
        if KeychainHelper.deleteData(forService: service, account: account) {
            print("AuthService: Session is cleared")
        } else {
            print("AuthService: Failed to delete data from keychain")
        }
    }
}
