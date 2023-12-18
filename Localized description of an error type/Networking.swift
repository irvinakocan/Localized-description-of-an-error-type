//
//  Networking.swift
//  Localized description of an error type
//
//  Created by Macbook Air 2017 on 18. 12. 2023..
//

import Foundation
import UIKit

let GET_USERS_ENDPOINT = "https://jsonplaceholder.typicode.com/users"

func getUsers() async throws -> [User] {
    
    guard let url = URL(string: GET_USERS_ENDPOINT) else {
        throw NetworkError.invalidURL
    }
    
    var result: (data: Data, response: URLResponse)
    do {
        result = try await URLSession.shared.data(from: url)
    }
    catch {
        throw NetworkError.httpConnectionError
    }
    
    if let response = result.response as? HTTPURLResponse {
        if response.statusCode != 200 {
            throw NetworkError.invalidResponseError(code: response.statusCode)
        }
    }
    
    var users = [User]()
    do {
        users = try JSONDecoder().decode([User].self, from: result.data)
        return users
    }
    catch {
        throw NetworkError.decodingError
    }
}
