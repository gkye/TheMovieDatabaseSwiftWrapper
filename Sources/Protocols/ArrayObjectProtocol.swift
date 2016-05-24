//
//  ArrayObjectProtocol.swift
//  TMDBSwift
//
//  Created by George on 2016-05-21.
//  Copyright © 2016 George. All rights reserved.
//

import Foundation

//MARK: Array protocol returns an array of types by initlizaing using the json passed
protocol ArrayObject {
    init(results: JSON)
}

extension ArrayObject {
    static func initialize<T:ArrayObject>(json json: JSON) -> [T] {
        var array = [T]()
        json.forEach(){
            array.append(T.init(results: $0.1))
        }
        return array
    }
}