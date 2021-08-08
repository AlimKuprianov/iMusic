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
        case .presentTracks:
            print("presentTracks")
            viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks)
        }
        
    }
}
