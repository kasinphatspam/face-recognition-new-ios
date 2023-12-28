import Foundation

struct UserServiceResponse: Codable {
    let message: String
}

class UserService {
    
    private let connectionHelper = ConnectionHelper()
    
    func exitOrganization(completion: @escaping (Error?, Bool) -> Void) async throws {
        let connection = Connection(url: connectionHelper.leaveOrg())
        try await connection.delete(body: nil, headers: ["session": GlobalVariables.session]) { error, status, data in
            guard let data = data, error == nil else {
                completion(error, false)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode(UserServiceResponse.self, from: data) else {
                print("UserService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                completion(JSONDecoderError.decodeFailure, false)
                return
            }
            
            if status {
                completion(nil, true)
            }
        }
    }
}
