//
//  PersistenceManager.swift
//  Movs
//
//  Created by Ever Aliaga on 2/7/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import RealmSwift

class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    private init() {
    }
    
    public func saveMovies(movies: [Movie]){
        do {
            let realm = try! Realm()
            try realm.write {
                for movie in movies {
                    realm.add(movie, update: true)
                }
            }
            NotificationCenter.default.post(Notification(name: Notification.Name("SUCCESS_MOVIES"), object: nil))
        } catch let error as NSError {
            print(error)
            NotificationCenter.default.post(Notification(name: Notification.Name("ERROR_MOVIES"), object: nil))
        }
    }
    
    public func getMovies() -> [Movie] {
        let realm = try! Realm()
        return realm.objects(Movie.self).toArray(type: Movie.self)
    }
    
    public func searchMovieByTilte(title: String) -> [Movie] {
        let realm = try! Realm()
        return realm.objects(Movie.self).filter("title CONTAINS[c] %@", title).toArray(type: Movie.self)
    }
}

