//
//  Client_Seasons.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation
extension Client{
  static func Seasons(_ urlType: String!, api_key: String!, language: String?, completion: @escaping (ClientReturn) -> ()) -> (){
    var parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    let url = "https://api.themoviedb.org/3/tv/" + urlType
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
}
