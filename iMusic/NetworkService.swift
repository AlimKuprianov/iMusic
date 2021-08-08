//
//  NetworkService.swift
//  iMusic
//
//  Created by Алим Куприянов on 08.08.2021.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        
        
        let url = "https://itunes.apple.com/search"
        let params = ["term":"\(searchText)",
                      "media":"music",
                      "limit":"200" ]
        
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { responseData in
            
            if let error = responseData.error {
                print(error.localizedDescription)
                completion(nil)
                
                return
            }
            guard let data = responseData.data else { return }
            
            let decoded = JSONDecoder()
            
            do {
                let objects = try decoded.decode(SearchResponse.self, from: data)
                print(objects)
                completion(objects)
            }
            
            catch let error {
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
