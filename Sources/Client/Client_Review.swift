//
//  Client_Reviews.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
extension Client{
  
  static func review(api_key: String!, reviewId: String!, completion: (ClientReturn) -> ()) -> (){
    let parameters: [String : AnyObject] = ["api_key": api_key]
    let url = "https://api.themoviedb.org/3/review/\(reviewId)"
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
}