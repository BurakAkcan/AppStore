//
//  SocialAPI.swift
//  AppStore
//
//  Created by Burak AKCAN on 26.10.2022.
//

import Foundation

enum SocialAPI: API {
    
    case social
    
    var method: HttpMethod {
        switch self {
        case .social:
            return .get
        }
    }
    
    var scheme: HttpScheme {
        switch self {
        case .social:
            return .https
        }
    }
    
    var host: String {
        switch self {
        case .social:
            return "api.letsbuildthatapp.com"
        }
    }
    
    var path: String {
        switch self {
        case .social:
            return "/appstore/social"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .social:
            return nil
        }
    }
}
