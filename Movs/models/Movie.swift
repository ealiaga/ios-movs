//
//  Movie.swift
//  Movs
//
//  Created by Ever Aliaga on 2/7/19.
//  Copyright © 2019 Ever. All rights reserved.
//
import ObjectMapper
import RealmSwift

import UIKit
import RealmSwift

class Movie: Object, Mappable {
    
    @objc dynamic var id:Int = 0;
    @objc dynamic var title:String = ""
    @objc dynamic var overview:String = ""
    @objc dynamic var posterPath: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }

    func mapping(map: Map) {
        id    <- map["id"]
        title <- map["title"]
        overview <- map["overview"]
        posterPath <- map["poster_path"]
    }
}
