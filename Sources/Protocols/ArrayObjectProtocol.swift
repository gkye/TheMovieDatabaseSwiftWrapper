//
//  ArrayObjectProtocol.swift
//  TMDBSwift
//
//  Created by George Kye on 2016-05-21.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

//MARK: Array protocol returns an array of types by initlizaing using the json passed
public protocol ArrayObject {
  init(results: JSON)
}

public extension ArrayObject {
  
  public static func initialize<T:ArrayObject>(json: JSON) -> [T] {
    var array = [T]()
    json.forEach(){
      array.append(T.init(results: $0.1))
    }
    return array
  }
}
