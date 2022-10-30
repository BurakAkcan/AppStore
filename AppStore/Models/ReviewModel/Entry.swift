//
//  Entry.swift
//  AppStore
//
//  Created by Burak AKCAN on 29.10.2022.
//

import Foundation

struct Entry: Decodable {
    let title: Label
    let content: Label
    let author: Author
    let rating: Label
    
    private enum CodingKeys: String, CodingKey {
        case title, content, author
        case rating = "im:rating"
    }
}
