//
//  SearchModels.swift
//  iMusic
//
//  Created by Алим Куприянов on 08.08.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Search {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getTracks(searchTerm: String)
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentTracks(response: SearchResponse?)
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayTracks(searchViewModel: SearchViewModel)
      }
    }
  }
  
}

struct SearchViewModel {
    struct Cell: TrackViewModel {
        
        var iconURLString: String?
        var trackName: String
        var collectionName: String
        var previewStringURL: String?
        var artistName: String
    }
    
    let cells: [Cell]
}
