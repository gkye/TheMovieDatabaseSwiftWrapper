//
//  Find.swift
//  TheMovieDBWrapperSwift
//
//  Created by George Kye on 2016-02-06.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client{
  
  static func Certification(listType: String, completion: @escaping (ClientReturn) -> ()) -> (){
    let parameters: [String : AnyObject] = [:]
    let url = "https://api.themoviedb.org/3/certification/ " + listType + "/list";
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
}

