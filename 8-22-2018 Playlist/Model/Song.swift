//
//  Song.swift
//  8-22-2018 Playlist
//
//  Created by Eric Andersen on 8/22/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

class Song: Equatable, Codable {
    
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.artist == rhs.artist
            && lhs.title == rhs.title
    }
    
    
    let title: String
    let artist: String
    
    init(title: String, artist: String) {
        self.title = title
        self.artist = artist
    }
}
