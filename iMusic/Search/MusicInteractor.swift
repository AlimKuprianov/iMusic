//
//  MusicInteractor.swift
//  iMusic
//
//  Created by Алим Куприянов on 08.08.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MusicBusinessLogic {
  func makeRequest(request: Music.Model.Request.RequestType)
}

class MusicInteractor: MusicBusinessLogic {

  var presenter: MusicPresentationLogic?
  var service: MusicService?
  
  func makeRequest(request: Music.Model.Request.RequestType) {
    if service == nil {
      service = MusicService()
    }
  }
  
}
