//
//  SearchViewController.swift
//  iMusic
//
//  Created by Алим Куприянов on 08.08.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchDisplayLogic: class {
  func displayData(viewModel: Search.Model.ViewModel.ViewModelData)
}


class SearchViewController: UIViewController, SearchDisplayLogic {

  var interactor: SearchBusinessLogic?
  var router: (NSObjectProtocol & SearchRoutingLogic)?
    
    
    @IBOutlet weak var table: UITableView!
    
    
    let searchController = UISearchController(searchResultsController: nil)
    private var searchVM = SearchViewModel.init(cells: [])
    private var timer: Timer?
    
    
  // MARK: - Setup
  
  private func setup() {
    let viewController        = self
    let interactor            = SearchInteractor()
    let presenter             = SearchPresenter()
    let router                = SearchRouter()
    viewController.interactor = interactor
    viewController.router     = router
    interactor.presenter      = presenter
    presenter.viewController  = viewController
    router.viewController     = viewController
  }
  
  

  
  // MARK: - View lifecycle
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupSearchBar()
        setupTableView()
        
        view.backgroundColor = .systemBackground
    }
    
    private func setupTableView() {
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        let nib = UINib(nibName: "TrackCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: TrackCell.reuseId)
    }
    
    
    private func setupSearchBar() {
        let searchVC = UISearchController(searchResultsController: nil)
        searchVC.searchBar.delegate = self
        searchVC.obscuresBackgroundDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchVC
    }
    
    
    
  func displayData(viewModel: Search.Model.ViewModel.ViewModelData) {

    switch viewModel {
    
    case .some:
        print("vc some")
    case .displayTracks(let searchViewModel):
        print("vc tracks")
        self.searchVM = searchViewModel
        table.reloadData()
    }
  }
  
}


// MARK: - UITableViewDelegate, UITableViewDataSource


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchVM.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: TrackCell.reuseId, for: indexPath) as! TrackCell
        
        let cellViewModel = searchVM.cells[indexPath.row]
        cell.iconImageView.backgroundColor = .red
        cell.set(trackViewModel: cellViewModel)
        

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    
}


extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
            self?.interactor?.makeRequest(request: Search.Model.Request.RequestType.getTracks(searchTerm: searchText))
        })
    }
}
