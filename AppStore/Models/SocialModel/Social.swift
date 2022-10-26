//
//  Social.swift
//  AppStore
//
//  Created by Burak AKCAN on 26.10.2022.
//

import Foundation

// MARK: - SocialElement
struct Social: Codable {
    let id, name, tagline: String
    let imageUrl: String
}

typealias Socials = [Social]
