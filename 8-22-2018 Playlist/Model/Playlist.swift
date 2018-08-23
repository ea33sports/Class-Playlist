//
//  Playlist.swift
//  8-22-2018 Playlist
//
//  Created by Eric Andersen on 8/22/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

class Playlist: Equatable, Codable {
    
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.name == lhs.name
            && lhs.songs == rhs.songs
    }
    
    
    let name: String
    var songs: [Song]
    
    // Add a default value of and empty string...
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
}
