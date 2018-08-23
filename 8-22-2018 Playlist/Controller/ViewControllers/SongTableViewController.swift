//
//  SongTableViewController.swift
//  8-22-2018 Playlist
//
//  Created by Eric Andersen on 8/22/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    
    
    // Landing Path
    // Info getting passed in the segue
    var playlist: Playlist?
    let playlistViewController = PlaylistTableViewController()
    
    
    // UILifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpUI()
        tableView.reloadData()
    }
    
    
    
    // MARK: - Visual Effect
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let clearColor = UIColor.clear
        cell.backgroundColor = UIColor(white: 1, alpha: 0.3)
        cell.textLabel?.backgroundColor = clearColor
        cell.detailTextLabel?.backgroundColor = clearColor
    }
    
    
    
    // MARK: - IBActions
    @IBAction func addSongButtonTapped(_ sender: Any) {
        
        if artistTextField.text != "",
           titleTextField.text != "" {
            guard let songTitle = titleTextField.text,
                  let artistName = artistTextField.text,
                  let playlist = playlist else { return }
            SongController.shared.createSong(name: songTitle, artist: artistName, playlist: playlist)
            tableView.reloadData()
            artistTextField.text = ""
            titleTextField.text = ""
        } else {
            return
        }
    }
    
    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let playlist = playlist else { return 0 }
        return playlist.songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        // Configure the cell...
        let song = playlist?.songs[indexPath.row]
        cell.textLabel?.text = song?.title
        cell.detailTextLabel?.text = song?.artist

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete song from Source of Truth
            guard let playlist = playlist else { return }
            let song = playlist.songs[indexPath.row]
            SongController.shared.deleteSong(song: song, playlist: playlist)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}



extension SongTableViewController {
    
    // MARK: - UI
    func setUpUI() {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "SkiSunset copy 2.jpeg"))
        tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFill
        
        // Make a blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
        imageView.clipsToBounds = true
    }
}

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
