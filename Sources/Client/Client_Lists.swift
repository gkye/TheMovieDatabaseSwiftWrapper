//
//  Client_List.swift
//  TheMovieDBWrapperSwift
//
//  Created by George on 2016-02-08.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation


extension Client{
  
  static func Lists(_ url: String!, api_key: String!, listId: String!, completion: @escaping (ClientReturn) -> ()) -> (){
    let parameters: [String : AnyObject] = ["api_key": api_key as AnyObject]
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
}
