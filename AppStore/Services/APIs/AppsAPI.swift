//
//  AppsAPI.swift
//  AppStore
//
//  Created by Burak AKCAN on 24.10.2022.
//

import Foundation

enum AppsAPI: API {
    
    case free
    case paid
    
    var method: HttpMethod {
        switch self {
        case .free, .paid:
            return .get
        }
    }
    
    var scheme: HttpScheme {
        switch self {
        case .free, .paid:
            return .https
        }
    }
    
    var host: String {
        switch self {
        case .free, .paid :
            return "rss.applemarketingtools.com"
        }
    }
    
    var path: String {
        switch self {
        case .free:
            return "/api/v2/us/apps/top-free/50/apps.json"
        case .paid:
            return "/api/v2/us/apps/top-paid/50/apps.json"
        }
    }
    
    var parameters: [URLQueryItem]? {
        
        switch self {
        case .free, .paid:
            return nil
        }
    }
}
