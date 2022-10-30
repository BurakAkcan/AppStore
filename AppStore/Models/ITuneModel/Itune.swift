//
//  ITune.swift
//  AppStore
//
//  Created by Burak AKCAN on 21.10.2022.
//

import Foundation

// MARK: - Result

public struct Itune: Codable {
    let trackId: Int?
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
    let formattedPrice: String?
    let description: String
    let releaseDate: String
    let releaseNotes: String?
}
