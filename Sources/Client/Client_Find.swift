//
//  Client_Find.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-09.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
extension Client{
  
  
  static func Find(_ api_key: String!, external_id: String!, external_source: String!, completion: @escaping (ClientReturn) -> ()) -> (){
    var parameters: [String : AnyObject] = [:]
    parameters["external_source"] = external_source as AnyObject?
    
    let url = "https://api.themoviedb.org/3/find/" + external_id
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
}
