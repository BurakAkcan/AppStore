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


public struct Itunes: Decodable {
    let screenshotUrls: [String]
    let artworkUrl60: String
    let ipadScreenshotUrls: [String]
   // let appletvScreenshotUrls: [JSONAny]
    let artworkUrl512, artworkUrl100: String
    let artistViewURL: String
    let isGameCenterEnabled: Bool
    let advisories: [String]
    let features: [Feature]
    let supportedDevices: [String]
    let kind: Kind
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let averageUserRating: Double
    let trackViewURL: String
    let trackContentRating: Rating
    let minimumOSVersion, trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let sellerURL: String?
    let formattedPrice: FormattedPrice
    let contentAdvisoryRating: Rating
    let currentVersionReleaseDate: Date
    let releaseNotes, resultDescription: String
    let currency: Currency
    let releaseDate: Date
    let bundleID, primaryGenreName: String
    let primaryGenreID: Int
    let genreIDS: [String]
    let trackID: Int
    let trackName: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let sellerName: String
    let artistID: Int
    let artistName: String
    let genres: [String]
    let price: Int
    let version: String
    let wrapperType: Kind
    let userRatingCount: Int

    enum CodingKeys: String, CodingKey {
        case screenshotUrls, artworkUrl60, ipadScreenshotUrls, artworkUrl512, artworkUrl100
        case artistViewURL
        case isGameCenterEnabled, advisories, features, supportedDevices, kind, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion, averageUserRating
        case trackViewURL
        case trackContentRating
        case minimumOSVersion
        case trackCensoredName, languageCodesISO2A, fileSizeBytes
        case sellerURL
        case formattedPrice, contentAdvisoryRating, currentVersionReleaseDate, releaseNotes
        case resultDescription
        case currency, releaseDate
        case bundleID
        case primaryGenreName
        case primaryGenreID
        case genreIDS
        case trackID
        case trackName, isVppDeviceBasedLicensingEnabled, sellerName
        case artistID
        case artistName, genres, price, version, wrapperType, userRatingCount
    }
}

enum Rating: String, Decodable {
    case the12 = "12+"
    case the4 = "4+"
}

enum Currency: String, Decodable {
    case usd = "USD"
}

enum Feature: String, Decodable {
    case iosUniversal = "iosUniversal"
}

enum FormattedPrice: String, Decodable {
    case free = "Free"
}

enum Kind: String, Decodable {
    case software = "software"
}
