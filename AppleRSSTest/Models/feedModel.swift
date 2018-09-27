//
//  feedModel.swift
//  AppleRSSTest
//
//  Created by Trevor Doodes on 24/09/2018.
//  Copyright © 2018 Ironworks Media Limited. All rights reserved.
//

import Foundation

struct Top: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Result]
}

struct Author: Codable {
    let name: String
    let uri: String
}

struct Link: Codable {
    let primary: String
    let alternate: String
    
    enum CodingKeys: String, CodingKey
    {
        case primary = "self"
        case alternate = "alternate"
    }
}

struct Result: Codable {
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

struct Genre: Codable {
    let id: String
    let name: String
    let url: String
}


