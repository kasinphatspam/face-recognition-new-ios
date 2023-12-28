import Foundation

struct EncoderResponse: Codable {
    let message: String
}

struct RecognitionResponse: Codable {
    let accuracy: [Float]?
    let statusCode: Int
    let result: [Contact]?
}

class RecognitionService {
    
    private let connectionHelper = ConnectionHelper()
    
    // MARK: - Public Methods
    
    func train(contactId: Int, image: String, completion: @escaping (Error?, Bool, EncoderResponse?) -> Void) async throws {
        guard let user = GlobalVariables.user, let organization = user.organization else {
            return
        }
        
        let body = ["image": image]
        
        let connection = Connection(url: connectionHelper.train(id: contactId))
        try await connection.put(body: body, headers: ["session": GlobalVariables.session]) { error, success, data in
            guard let data = data, error == nil else {
                completion(error, false, nil)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode(EncoderResponse.self, from: data) else {
                print("RecognitionService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                completion(JSONDecoderError.decodeFailure, false, nil)
                return
            }
            
            print("RecognitionService: Encode new faces of contact id: \(contactId)")
            completion(nil, true, decoded)
        }
    }

    func recognize(image: String, completion: @escaping (Error?, Bool, RecognitionResponse?) -> Void) async throws {
        guard let user = GlobalVariables.user, let organization = user.organization else {
            return
        }
        
        let body = ["image": image]
        let connection = Connection(url: connectionHelper.recognize())
        try await connection.post(body: body, headers: ["session": GlobalVariables.session]) { error, success, data in
            guard let data = data, error == nil else {
                completion(error, false, nil)
                return
            }
            
            guard let decoded = try? JSONDecoder().decode(RecognitionResponse.self, from: data) else {
                print("RecognitionService: Error decode failure \(String(decoding: data, as: UTF8.self))")
                completion(JSONDecoderError.decodeFailure, false, nil)
                return
            }
            
            if decoded.accuracy == nil && decoded.statusCode == 500 && decoded.result == nil {
                completion(error, false, nil)
            }
            completion(nil, true, decoded)
        }
    }
}
