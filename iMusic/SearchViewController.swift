//
//  SearchViewController.swift
//  iMusic
//
//  Created by Алим Куприянов on 07.08.2021.
//

import UIKit

struct TrackModel {
    
    let artistName: String
    let musicName: String
}


class SearchViewController: UITableViewController {
    
    
    let array = [TrackModel(artistName: "Billie", musicName: "Eilish"),
                 TrackModel(artistName: "Billie", musicName: "Eilish"),
                 TrackModel(artistName: "Billie", musicName: "Eilish"),
                 TrackModel(artistName: "Billie", musicName: "Eilish")]

    override func viewDidLoad() {
        super.viewDidLoad()


        let searchVC = UISearchController()
        navigationItem.searchController = searchVC
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.backgroundColor = .white
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)

        cell.textLabel?.text = "indexpath: \(indexPath)"
        return cell
    }
}
