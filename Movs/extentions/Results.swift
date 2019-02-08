//
//  Results.swift
//  Movs
//
//  Created by Ever Aliaga on 2/7/19.
//  Copyright © 2019 Ever. All rights reserved.
//

import RealmSwift

extension Results {
    func toArray<T>(type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}
