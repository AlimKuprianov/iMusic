//
//  SearchResponse.swift
//  iMusic
//
//  Created by Алим Куприянов on 07.08.2021.
//

import Foundation

struct SearchResponse: Decodable {
    
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    
    var artistName: String
    var collectionName: String?
    var trackName: String
    var previewUrl: String
    var artworkUrl100: String?
}
