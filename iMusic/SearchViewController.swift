//
//  SearchViewController.swift
//  iMusic
//
//  Created by Алим Куприянов on 07.08.2021.
//

import UIKit
import Alamofire

struct TrackModel {
    
    let artistName: String
    let musicName: String
}


class SearchViewController: UITableViewController {
    
    
    var timer: Timer?
    var array = [Track]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupSearchBar()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.backgroundColor = .white
        
    }
    
    // MARK: - setupSearchBar()
    
    private func setupSearchBar() {
        let searchVC = UISearchController(searchResultsController: nil)
        searchVC.searchBar.delegate = self
        searchVC.obscuresBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchVC
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)

        var cell2 = cell.defaultContentConfiguration()
        cell2.image = #imageLiteral(resourceName: "Album Image 4")
        cell2.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        cell2.imageProperties.cornerRadius = 0
        let track = array[indexPath.row]
        cell2.text = "\(track.artistName) \n\(track.trackName)"
        cell2.textProperties.numberOfLines = 2

        
        cell.contentConfiguration = cell2
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            
            
            let url = "https://itunes.apple.com/search"
            let params = ["term":"\(searchText)",
                          "media":"music",
                          "limit":"200" ]
            
            AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { responseData in
                
                if let error = responseData.error {
                    print(error.localizedDescription)
                    
                    return
                }
                guard let data = responseData.data else { return }
                
                let decoded = JSONDecoder()
                
                do {
                    let objects = try decoded.decode(SearchResponse.self, from: data)
                    print(objects)
                    self.array = objects.results
                    self.tableView.reloadData()
                    
                }
                
                catch let error {
                    print(error.localizedDescription)
                }
            }
        })
       
    }
}
