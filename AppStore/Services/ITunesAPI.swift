//
//  ITunesAPI.swift
//  AppStore
//
//  Created by Burak AKCAN on 21.10.2022.
//

import Foundation

enum ITunesAPI: API {
    
    case iTune(term: String)
    
    var method: HttpMethod {
        switch self {
        case .iTune:
            return .get
        }
        
    }
    
    var scheme: HttpScheme {
        switch self {
        case .iTune:
            return .https
        }
        
    }
    
    var host: String {
        switch self {
        case .iTune:
            return "itunes.apple.com"
        }
        
    }
    
    var path: String {
        switch self {
        case .iTune:
            return "/search"
        }
        
    }
    
    var parameters: [URLQueryItem] {
        
        switch self {
        case .iTune(let term):
            let params = [
                URLQueryItem(name: "term", value: "\(term)"),
                URLQueryItem(name: "entity", value: "software")
            ]
            
            return params
        }
        
       
    }
    
    
}
// term=instagram&entity=software
