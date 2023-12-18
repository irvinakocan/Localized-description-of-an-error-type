//
//  NetworkError.swift
//  Localized description of an error type
//
//  Created by Macbook Air 2017 on 18. 12. 2023..
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case httpConnectionError
    case invalidResponseError(code: Int)
    case decodingError
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
            
        case .invalidURL:
            return NSLocalizedString("There is a problem with a URL, such as an invalid URL or a timeout.", comment: "Invalid URL")
            
        case .httpConnectionError:
            return NSLocalizedString("There is an issue with an HTTP request or there is no internet connection", comment: "HTTP/Connection Error")
            
        case .invalidResponseError(let code):
            return NSLocalizedString("The server responds with an unexpected format with the status code \(code).", comment: "Invalid Response Error")
            
        case .decodingError:
            return NSLocalizedString("The data received from the server is unable to be decoded as the expected type.", comment: "Decoding Error")
        }
    }
}
