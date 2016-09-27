//
//  Client_Credits.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-07.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation


extension Client{
  
  static func Credits(_ api_key: String, creditID: String, language: String, completion: @escaping (ClientReturn) -> ()) -> (){
    var parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    parameters["language"] = language as AnyObject?
    let url = "https://api.themoviedb.org/3/credit/"+creditID
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
      
    })
  }
}
