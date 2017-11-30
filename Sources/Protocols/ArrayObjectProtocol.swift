//
//  ArrayObjectProtocol.swift
//  TMDBSwift
//
//  Created by George Kye on 2016-05-21.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public typealias DecodeableObjectType<T> = (entryKeys: [String], json: JSON, decodedArr: [T])


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
	
	// Used only for append to methods. It deocded the main object and iterated through the array of secondary objects to return and array of those types. Find way to order?
	///
	/// - Parameters:
	///   - json: JSON to be decoded
	///   - key: entry key of secondary value
	/// - Returns: array of type
//  public static func decode<T:ArrayObject>(json: JSON, key: [String]) -> [T] {
//    var array = [T]()
//    var decodedJSON: JSON!
//    for key in keys {
//      if let js = json.json(forKey: key){
//        decodedJSON = js
//      }
//    }
//    //Check if deocedJSON not empty. If not deocoded and return an array of type
//    array = T.initialize(json: decodedJSON)
//    return array
//  }
	
//	public static func decode<T:ArrayObject>(type: T, json: JSON, arr: inout [T]) {
//		var decodedJSON: JSON!
//		arr.first.
//		for key in type.jsonEntryKeys {
//			if let js = json.json(forKey: key){
//				decodedJSON = js
//			}
//		}
//		guard decodedJSON != nil else { return }
//		arr = T.initialize(json: json)
//	}
}


