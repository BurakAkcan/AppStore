//
//  ITunesAPI.swift
//  AppStore
//
//  Created by Burak AKCAN on 21.10.2022.
//

import Foundation

enum ITunesAPI: API {
    
    case iTune(term: String)
    case look(id: String)
    
    var method: HttpMethod {
        switch self {
        case .iTune, .look:
            return .get
        }
    }
    
    var scheme: HttpScheme {
        switch self {
        case .iTune, .look:
            return .https
        }
    }
    
    var host: String {
        switch self {
        case .iTune, .look:
            return "itunes.apple.com"
        }
    }
    
    var path: String {
        switch self {
        case .iTune:
            return "/search"
        case .look:
            return "/lookup"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .iTune(let term):
            let params = [
                URLQueryItem(name: "term", value: "\(term)"),
                URLQueryItem(name: "entity", value: "software")
            ]
            return params
        case .look(let id):
            let params = [
                URLQueryItem(name: "id", value: id)
            ]
            return params
        }
    }
}


//https://itunes.apple.com/lookup?id=529815782
