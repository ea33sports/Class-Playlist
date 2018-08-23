//
//  PlaylistController.swift
//  8-22-2018 Playlist
//
//  Created by Eric Andersen on 8/22/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

class PlaylistController {
    
    // Initialize Class
    // Singleton pattern PREVENTS two instances to reach your variables and methods. It creates ONLY ONE instance to give you access to its instance methods and variables.
    static let shared = PlaylistController()
    
    // SOURCE OF TRUTH
    var playlists: [Playlist] = []
    
    init() {
        self.playlists = loadFromPersistentStore()
    }
    
    // C
    func createPlaylist(name: String) {
        let newPlaylist = Playlist(name: name)
        playlists.append(newPlaylist)
        saveToPersistentStore()
    }
    
    // R
    
    
    // U
    
    
    // D
    func deletePlaylist(playlistToDelete: Playlist) {
        guard let index = playlists.index(of: playlistToDelete) else { return }
        playlists.remove(at: index)
        saveToPersistentStore()
    }
    
    
    // MARK: - Persistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "playlists.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        print(fullURL)
        
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(playlists)
            print(data)
            try data.write(to: fileURL())
        } catch let error {
            print("💩 There was an error Saving to the Persistent Store \(error): \(error.localizedDescription) 💩")
        }
    }
    
    func loadFromPersistentStore() -> [Playlist] {
        do {
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: fileURL())
            let playlists = try decoder.decode([Playlist].self, from: data)
            return playlists
        } catch let error {
            print("💩 There was an error Saving to the Persistent Store \(error): \(error.localizedDescription) 💩")
        }
        // When you initially load. there should not be a playlists
        return []
    }
}
















































