//
//  Client_Networks.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
extension Client{
  
  static func networks(_ api_key: String!, networkId: Int!, completion: @escaping (ClientReturn) -> ()) -> (){
    let parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    let url = "https://api.themoviedb.org/3/network/" + String(networkId)
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
}
