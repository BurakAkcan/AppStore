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
