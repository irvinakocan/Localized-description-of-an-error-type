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
    case invalidResponseError
    case decodingError
}
