//
//  MusicPresenter.swift
//  iMusic
//
//  Created by Алим Куприянов on 08.08.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MusicPresentationLogic {
  func presentData(response: Music.Model.Response.ResponseType)
}

class MusicPresenter: MusicPresentationLogic {
  weak var viewController: MusicDisplayLogic?
  
  func presentData(response: Music.Model.Response.ResponseType) {
  
  }
  
}
