//
//  ITune.swift
//  AppStore
//
//  Created by Burak AKCAN on 21.10.2022.
//

import Foundation

// MARK: - Result

public struct Itune: Codable {
    
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float
    let screenshotUrls: [String]
    let artworkUrl100: String
}
