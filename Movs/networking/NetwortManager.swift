//
//  NetwortManager.swift
//  Movs
//
//  Created by Ever Aliaga on 2/7/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
    }
    
    public func getPopularMovies(){
        Alamofire.request(API.popularMoviesURL)
                 .responseArray(keyPath: "results") {
                 (response: DataResponse<[Movie]>) in
                    switch response.result {
                    case .success(let movies):
                        PersistenceManager.shared.saveMovies(movies: movies)
                    case .failure(let error):
                        print(error)
                    }
        
        }
    }
    
    
    
    
}
