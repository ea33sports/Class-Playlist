//
//  SongController.swift
//  8-22-2018 Playlist
//
//  Created by Eric Andersen on 8/22/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

class SongController {
    
    static let shared = SongController()
    
    func createSong(name: String, artist: String, playlist: Playlist) {
        let song = Song(title: name, artist: artist)
        playlist.songs.append(song)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.index(of: song) else { return }
        playlist.songs.remove(at: index)
        PlaylistController.shared.saveToPersistentStore()
    }
}
