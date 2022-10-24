//
//  APIError.swift
//  AppStore
//
//  Created by Burak AKCAN on 21.10.2022.
//

import Foundation

enum APIErrors: Error {
    case decoding
    case noData
    case badRequest
    case unAuthorized
    case toManyRequest
    case server
    
    var errorDescription: String? {
        switch self {
        case .decoding:
            return "Decoding Error"
        case .noData:
            return "No data return from server"
        case .badRequest:
           return "The request was unacceptable, often due to a missing or misconfigured parameter"
        case .unAuthorized:
            return "Your API key was missing from the request, or wasn't correct"
        case .toManyRequest:
            return "You made too many requests within a window of time and have been rate limited. Back off for a while"
        case .server:
            return "Something went wrong on server side"
        }
    }
}
