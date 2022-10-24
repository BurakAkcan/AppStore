//
//  File.swift
//  AppStore
//
//  Created by Burak AKCAN on 21.10.2022.
//

import Foundation

public struct ItunesResponse: Codable {
    let resultCount: Int
    let results: [Itune]
}



//public struct Movie: Decodable, Equatable {
//
//    public enum CodingKeys: String, CodingKey{
//        case artistName
//        case releaseDate
//        case name
//        case image = "artworkUrl100"
//        case genres
//    }
//
//    public let artistName: String
//    public let releaseDate: String
//    public let name: String
//    public let image: URL
//    public let genres: [Genre]
//}
//
//public struct Genre: Decodable, Equatable {
//    public let name: String
//}
