//
//  Apps.swift
//  AppStore
//
//  Created by Burak AKCAN on 24.10.2022.
//

import Foundation

struct AppResult: Codable {
    let artistName, id, name, releaseDate: String
    let artworkUrl100: String
    let url: String
}

enum Kind: String, Codable {
    case apps = "apps"
}


