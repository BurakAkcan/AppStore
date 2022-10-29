//
//  ReviewAPI.swift
//  AppStore
//
//  Created by Burak AKCAN on 29.10.2022.
//

import Foundation


enum ReviewAPI: API {
    
    case review(id: String)
    
    var method: HttpMethod {
        switch self {
        case .review:
            return .get
        }
    }
    
    var scheme: HttpScheme {
        switch self {
        case .review:
            return .https
        }
    }
    
    var host: String {
        switch self {
        case .review:
            return "itunes.apple.com"
        }
    }
    
    var path: String {
        switch self {
        case .review(let id):
            return "/rss/customerreviews/page=1/id=\(id)/sortby=mostrecent/json"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .review:
            let params = [
              URLQueryItem(name: "l", value: "en"),
              URLQueryItem(name: "cc", value: "us"),
              
            
            ]
            return params
        }
    }
}
//"https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId)/sortby=mostrecent/json?l=en&cc=us"
// https://itunes.apple.com/rss/customerreviews/page=1/id=1641791746/sortby=mostrecent/?json?l=en&cc=us
