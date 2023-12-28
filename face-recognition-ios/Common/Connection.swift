//
//  Connection.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import Foundation

class Connection {
    
    private var request: URLRequest
    
    init(url: String) {
        request = URLRequest(url: URL(string: url)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("\(EnviromentVariable.accessKey)", forHTTPHeaderField: "access-key")
    }
    
    private func addHeaders(_ headers: [String: String]?) {
        headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
    }
    
    private func setHTTPMethod(_ method: String) {
        request.httpMethod = method
    }
    
    private func setHTTPBody(_ body: Data?) {
        request.httpBody = body
    }
    
    func executeRequest(completion: @escaping (Error?, Bool, Data?) -> Void) async throws {
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(error, false, nil)
                return
            }
            completion(nil, true, data)
        }
        task.resume()
    }
    
    // MARK: - Public Methods
    
    func get(headers: [String: String]?, completion: @escaping (Error?, Bool, Data?) -> Void) async throws {
        setHTTPMethod("GET")
        addHeaders(headers)
        try await executeRequest(completion: completion)
    }
    
    func post(body: [String: Any]?, headers: [String: String]?, completion: @escaping (Error?, Bool, Data?) -> Void) async throws {
        setHTTPMethod("POST")
        addHeaders(headers)
        setHTTPBody(try? JSONSerialization.data(withJSONObject: body as Any))
        try await executeRequest(completion: completion)
    }
    
    func put(body: [String: Any]?, headers: [String: String]?, completion: @escaping (Error?, Bool, Data?) -> Void) async throws {
        setHTTPMethod("PUT")
        addHeaders(headers)
        setHTTPBody(try? JSONSerialization.data(withJSONObject: body as Any))
        try await executeRequest(completion: completion)
    }
    
    func delete(body: [String: Any]?, headers: [String: String]?, completion: @escaping (Error?, Bool, Data?) -> Void) async throws {
        setHTTPMethod("DELETE")
        addHeaders(headers)
        setHTTPBody(try? JSONSerialization.data(withJSONObject: body as Any))
        try await executeRequest(completion: completion)
    }
}
