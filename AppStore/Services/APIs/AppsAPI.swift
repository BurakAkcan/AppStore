//
//  AppsAPI.swift
//  AppStore
//
//  Created by Burak AKCAN on 24.10.2022.
//

import Foundation

enum AppsAPI: API {
    
    case apps
    
    var method: HttpMethod {
        switch self {
        case .apps:
            return .get
        }
        
    }
    
    var scheme: HttpScheme {
        switch self {
        case .apps:
            return .https
        }
        
    }
    
    var host: String {
        switch self {
        case .apps:
            return "rss.applemarketingtools.com"
        }
        
    }
    
    var path: String {
        switch self {
        case .apps:
            return "/api/v2/us/apps/top-free/50/apps.json"
        }
        
    }
    
    var parameters: [URLQueryItem]? {
        
        switch self {
        case .apps:
            return nil
        }
        
       
    }
    
    
}
// https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json
