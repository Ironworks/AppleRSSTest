//
//  feedModel.swift
//  AppleRSSTest
//
//  Created by Trevor Doodes on 24/09/2018.
//  Copyright © 2018 Ironworks Media Limited. All rights reserved.
//

import Foundation

struct ResponseBody: Decodable {
    var feed: Feed
}

struct Feed: Decodable {
    var title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Result]
}

struct Author: Decodable {
    let name: String
    let uri: String
}

struct Link: Decodable {
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case primary = "self"
        case alternate = "alternate"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            link = try values.decode(String.self, forKey: .primary)
        } catch {
            do {
                link = try values.decode(String.self, forKey: .alternate)
            }
        }
    }
}

struct Result: Decodable {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let kind: String
    let copyright: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
}

struct Genre: Decodable {
    let genreId: String
    let name: String
    let url: String
}


