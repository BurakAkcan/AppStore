//
//  File.swift
//  AppStore
//
//  Created by Burak AKCAN on 24.10.2022.
//

import Foundation

public struct FeedResponse: Codable {
    let title: String
    let id: String
    let copyright, country: String
    let results: [AppResult]
}
