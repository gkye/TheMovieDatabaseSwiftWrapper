//
//  Client_Reviews.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George KyeKye. All rights reserved.
//

import Foundation
extension Client{
  
  static func review(_ api_key: String!, reviewId: String!, completion: @escaping (ClientReturn) -> ()) -> (){
    let parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    let url = "https://api.themoviedb.org/3/review/"+reviewId
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
}
