//
//  SearchPresenter.swift
//  iMusic
//
//  Created by Алим Куприянов on 08.08.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
    
    func presentData(response: Search.Model.Response.ResponseType)
}


class SearchPresenter: SearchPresentationLogic {
    
    weak var viewController: SearchDisplayLogic?
    
    
    func presentData(response: Search.Model.Response.ResponseType) {
        
        switch response {
        case .some:
            print("some")
        case .presentTracks(let searchResults):
            
           let cells = searchResults?.results.map({ (track) in
                cellViewModel(from: track)
            }) ?? []
            
            print("presentTracks")
            let searchVM = SearchViewModel(cells: cells)
            viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks(searchViewModel: searchVM))
        }
        
    }
    
    
    private func cellViewModel(from track: Track) -> SearchViewModel.Cell {
        
        return SearchViewModel.Cell(iconURLString: track.artworkUrl100,
                                    trackName: track.trackName,
                                    collectionName: track.collectionName ?? "",
                                    artistName: track.artistName)
    }
}
